const std = @import("std");
pub const c_flecs = @import("c_flecs.zig");

pub const Entity = c_flecs.ecs_entity_t;
pub const Component = Entity;
pub const System = Entity;

pub const Phase = enum(@TagType(c_flecs.EcsSystemKind)) {
    OnUpdate = @enumToInt(c_flecs.EcsSystemKind.EcsOnUpdate),
};

pub const Rows = struct {
    pub inner: *c_flecs.ecs_rows_t,
    fn init(rows: *c_flecs.ecs_rows_t) @This() {
        return @This() {
            .inner = rows,
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
    pub fn getColumn(self: @This(), comptime T: type, ix: usize) [*]T {
        return @ptrCast([*]T, @alignCast(@alignOf(T), c_flecs._ecs_column(self.inner, @sizeOf(T), 1)));
    }
};


/// Map system entity IDs to zig functions
const SystemMap = std.AutoHashMap(c_flecs.ecs_entity_t, fn(Rows) void);
var system_map: ?SystemMap = null;

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

pub const World = struct {
    inner: *c_flecs.ecs_world,
    allocator: *std.mem.Allocator,
    frame_delta: f32 = 1.0 / 60.0,

    pub fn init(allocator: *std.mem.Allocator) @This() {
        if (system_map == null) {
            system_map = SystemMap.init(allocator);
        } else {
            @panic("Multiple worlds unsupported (for now).");
        }
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

    pub fn registerComponent(self: @This(), comptime T: type) Component {
        comptime var c_string_lit : [@typeName(T).len + 1]u8 = undefined;
        comptime {
            inline for (@typeName(T)) |c, ix| {
                c_string_lit[ix] = c;
            }
            c_string_lit[c_string_lit.len - 1] = 0;
        }
        return c_flecs.ecs_new_component(self.inner, &c_string_lit, @sizeOf(T));
    }

    pub fn progress(self: @This()) void {
        _ = c_flecs.ecs_progress(self.inner, self.frame_delta);
    }

    /// Register a system with the given signature: https://github.com/SanderMertens/flecs/blob/master/Manual.md#system-signatures
    pub fn registerSystem(self: @This(), name: [*c]const u8, phase: Phase, function: fn(Rows) void, sig: [*c]const u8) !void {
        const sys = c_flecs.ecs_new_system(self.inner, name, @bitCast(c_flecs.EcsSystemKind, phase), sig, systemDispatcher);
        _ = try system_map.?.put(sys, function);
    }

    pub fn new(self: @This()) Entity {
        return c_flecs._ecs_new(self.inner, null);
    }

    pub fn set(self: @This(), entity: Entity, c_type: Component, val: var) void {
        var val_copied = val;
        _ = c_flecs._ecs_set_ptr(self.inner, entity, c_type, @sizeOf(@typeOf(val)), &val_copied);
    }
};




