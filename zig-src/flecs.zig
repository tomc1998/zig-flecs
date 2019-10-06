const std = @import("std");
pub const c_flecs = @import("c_flecs.zig");

pub const Entity = c_flecs.ecs_entity_t;
pub const System = Entity;

pub const Phase = enum(@TagType(c_flecs.EcsSystemKind)) {
    OnUpdate = @enumToInt(c_flecs.EcsSystemKind.EcsOnUpdate),
};

pub const Rows = struct {
    type_map: std.StringHashMap(u32),
    pub inner: *c_flecs.ecs_rows_t,
    fn init(rows: *c_flecs.ecs_rows_t, type_map: std.StringHashMap(u32)) @This() {
        return @This() {
            .inner = rows,
            .type_map = type_map,
        };
    }

    pub fn getSystem(self: @This()) System { return self.inner.system; }
    pub fn getDeltaTime(self: @This()) f32 { return self.inner.delta_time; }
    pub fn getWorldTime(self: @This()) f32 { return self.inner.world_time; }
    pub fn getFrameOffset(self: @This()) u32 { return self.inner.frame_offset; }
    pub fn getOffset(self: @This()) u32      { return self.inner.offset; }
    pub fn count(self: @This()) u32       { return self.inner.count; }
    pub fn getInterruptedBy(self: @This()) u32 { return self.inner.count; }

    /// Return the column at the given ix. ty should be the type of entities in
    /// that column (see the entity signature).
    /// If the column is shared, there will be only one data item.
    /// Otherwise, the length should be equal to self.count().
    /// Prefer comp() to this, unless the extra performance is needed (one less hash table lookup)
    pub fn col_ix(self: @This(), comptime T: type, ix: u32) []T {
        if (c_flecs.ecs_is_shared(self.inner, ix)) {
            return @ptrCast([*]T, @alignCast(@alignOf(T), c_flecs._ecs_column(self.inner, @sizeOf(T), 1)))[0..1];
        } else {
            return @ptrCast([*]T, @alignCast(@alignOf(T), c_flecs._ecs_column(self.inner, @sizeOf(T), 1)))[0..self.count()];
        }
    }

    /// Get a component with a type. This is a convenience, function, and uses a
    /// hash map to lookup the column of the type name. For maximum performance (but
    /// slightly uglier code), access by the column index with col()
    pub fn col(self: @This(), comptime T: type) []T {
        const ix_opt = self.type_map.get(@typeName(T));
        if (ix_opt) |ix| {
            return self.col_ix(T, ix.value);
        } else {
            @panic("Can't find component " ++ @typeName(T) ++ " in system.");
        }
    }
};

const ColModifier = enum {
    Self,
};

const ColDesc = struct {
    T: type,
    modifier: ColModifier,
};

pub fn SystemSignature(comptime n: i32, comptime cols: [n]ColDesc) type {
    // Compute signature as a string
    comptime const string_sig = c"Pos";
    return struct {
        pub fn count(self: @This()) i32 { return n; }
        pub fn asStr(self: @This()) [*c]const u8 {
            return string_sig;
        }
        pub fn getCols(self: @This()) comptime [n]ColDesc {
            return cols;
        }
        pub fn getColIndex(comptime col: type) i32 {
            comptime {
                for (cols) |c, ix| {
                    if (c.T == col) {
                        return ix;
                    }
                }
            }
            @panic("Can't find col of type " ++ @typeName(col));
        }
        fn ThisPlusOneColumn(comptime T: type) type {
            comptime const desc = ColDesc {.T = T, .modifier = ColModifier.Self};
            return SystemSignature(n + 1, cols ++ [1]ColDesc{desc});
        }
        pub fn col(self: @This(), comptime T: type) ThisPlusOneColumn(T) {
            return ThisPlusOneColumn(T) {};
        }
    };
}

pub fn buildSig() SystemSignature(0, [0]ColDesc {}) {
    return SystemSignature(0, [0]ColDesc {}) {};
}

/// Get static memory with the given id. ID must be supplied so zig caches the
/// result for the same T and same id.
fn getStaticMemoryInit(comptime id: var, comptime val: var) *@typeOf(val) {
    return &struct { pub var buf: @typeOf(val) = val; }.buf;
}

/// Get static memory with the given id. ID must be supplied so zig caches the
/// result for the same T and same id.
fn getStaticMemory(comptime id: var, comptime T: type) *T {
    return &struct { pub var buf: T = undefined; }.buf;
}

/// Get a type map, mapping type names to column indexes
fn getTypeMapForSystem(comptime system_id: var, comptime sig: var) std.StringHashMap(u32) {
    return struct {
        pub fn get() std.StringHashMap(u32) {
            const TypeMapAndInitialised = struct {
                init: bool = false,
                type_map: std.StringHashMap(u32) = undefined,
            };
            // Initialise type map, to map type names to columns. Allocate
            // enough for the columns we have, assuming each column takes 40 bytes
            // for an entry in the hash map.
            const bytes_per_entry = @sizeOf(std.StringHashMap(u32).Entry);
            var type_map_memory = getStaticMemory(system_id, [bytes_per_entry * sig.getCols().len]u8);
            var type_map_and_initialised = getStaticMemoryInit(system_id, TypeMapAndInitialised {});
            if (!type_map_and_initialised.init) {
                type_map_and_initialised.init = true;
                const type_map = &type_map_and_initialised.type_map;
                var fixed_alloc = std.heap.FixedBufferAllocator.init(type_map_memory[0..]);
                var allocator = &fixed_alloc.allocator;
                type_map.* = std.StringHashMap(u32).init(allocator);
                type_map.ensureCapacityExact(sig.getCols().len) catch @panic("Error, not enough memory allocated");
                // Insert types
                inline for (sig.getCols()[0..]) |col_desc, ix| {
                    _ = type_map.putAssumeCapacity(@typeName(col_desc.T), ix);
                }
            }
            return type_map_and_initialised.type_map;
        }
    }.get();
}

/// Wrap a zig function in a C compatible ABI
fn initSystemDispatcher(comptime function: fn (rows: Rows) void, comptime system_id: var, comptime sig: var)
    extern fn (rows: [*c]c_flecs.ecs_rows_t) void {
        return struct {
            pub extern "c" fn function(rows: [*c]c_flecs.ecs_rows_t) void { function(Rows.init(rows, getTypeMapForSystem(system_id, sig))); }
        }.function;
}

fn toCStringLit(comptime string: []const u8) [*c]const u8 {
    return (string ++ "\x00")[0..].ptr;
}

extern "c" fn systemDispatcher(rows: [*c]c_flecs.ecs_rows_t) void {
    // Wrap the rows
    const wrapped = Rows.init(rows);

    // Figure out which system this should be, dispatch that
    var res_fn = system_map.?.get(rows.*.system);
    if (res_fn) |function| { 
        function.value(wrapped);
    } else {
        std.debug.warn("Error: can't find system {}\n", rows.*.system);
    }
}

/// Gets a pointer to some static data for the given type. Useful for storing flecs component handles.
fn getComponentHandle(comptime T : type) *u64 {
    return &(struct { pub var handle : u64 = undefined; }.handle);
}

pub const World = struct {
    inner: *c_flecs.ecs_world,
    allocator: *std.mem.Allocator,
    frame_delta: f32 = 1.0 / 60.0,

    pub fn init(allocator: *std.mem.Allocator) @This() {
        return @This() {
            .inner = c_flecs.ecs_init().?,
            .allocator = allocator,
        };
    }

    pub fn deinit(self: @This()) void {
        _ = c_flecs.ecs_fini(self.inner);
    }

    pub fn setTargetFps(self: *@This(), fps: f32) void {
        self.frame_delta = 1.0 / fps;
        c_flecs.ecs_set_target_fps(self.inner, fps);
    }

    pub fn registerComponent(self: @This(), comptime T: type) void {
        comptime var c_string_lit : [@typeName(T).len + 1]u8 = undefined;
        comptime {
            inline for (@typeName(T)) |c, ix| {
                c_string_lit[ix] = c;
            }
            c_string_lit[c_string_lit.len - 1] = 0;
        }
        getComponentHandle(T).* = c_flecs.ecs_new_component(self.inner, &c_string_lit, @sizeOf(T));
    }

    /// Given a component, get the internal flecs component handle. If T hasn't
    /// been registered, the result of this function is undefined.
    pub fn getFlecsComponentHandle(comptime T : type) u64 {
        return getComponentHandle(T).*;
    }

    pub fn progress(self: @This()) void {
        _ = c_flecs.ecs_progress(self.inner, self.frame_delta);
    }

    /// Register a system with the given signature: https://github.com/SanderMertens/flecs/blob/master/Manual.md#system-signatures
    /// Need to provide a name for the system for better debug info.
    /// @param sig a SystemSignature
    pub fn registerSystem(self: @This(),
                          comptime name: []const u8,
                          phase: Phase,
                          comptime function: fn(Rows) void,
                          comptime sig: var) void {
        const sys = c_flecs.ecs_new_system(self.inner,
                                           toCStringLit(name),
                                           @bitCast(c_flecs.EcsSystemKind, phase),
                                           sig.asStr(),
                                           initSystemDispatcher(function, name, sig));
    }

    /// Create a new entity with the given components. Add components later on with set().
    pub fn new(self: @This(), component_vals: ...) Entity {
        const e = c_flecs._ecs_new(self.inner, null);
        comptime var ii : usize = 0;
        inline while (ii < component_vals.len) {
            self.set(e, component_vals[ii]);
            ii += 1;
        }
        return e;
    }

    /// Create a prefab and return it. Set values in this prefab, then use newInstance().
    pub fn newPrefab(self: @This(), component_vals: ...) Entity {
        const e = self.new(component_vals);
        c_flecs._ecs_add(self.inner, e, c_flecs.ecs_type_from_entity(self.inner, c_flecs.EEcsPrefab));
        return e;
    }


    pub fn newInstance(self: @This(), super: Entity) Entity {
        return c_flecs._ecs_new_instance(self.inner, super, null);
    }

    pub fn set(self: @This(), entity: Entity, val: var) void {
        comptime const T = @typeOf(val);
        const handle = getComponentHandle(T).*;
        var val_copied = val;
        _ = c_flecs._ecs_set_ptr(self.inner, entity, handle, @sizeOf(@typeOf(val)), &val_copied);
    }
};




