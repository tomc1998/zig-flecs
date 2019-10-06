const ecs = @import("flecs").c_flecs;
const std = @import("std");

const FRAME_DELTA : f32 = 1.0 / 60.0;

pub const Pos = struct {
    pub x: f32 = 0.0,
    pub y: f32 = 0.0,

    pub fn init(x: f32, y: f32) Pos {
        return Pos { .x = x, .y = y };
    }
};

extern "c" fn move(data: [*c]ecs.ecs_rows_t) void {
    const pos_arr = @ptrCast([*]Pos, @alignCast(4, ecs._ecs_column(data, @sizeOf(Pos), 1)));
    var ii : usize = 0;
    while (ii < data.*.count) {
        pos_arr[ii].x += 1.0;
        pos_arr[ii].y += 1.0;
        ii += 1;
    }
}

extern "c" fn print(data: [*c]ecs.ecs_rows_t) void {
    const pos_arr = @ptrCast([*]Pos, @alignCast(4, ecs._ecs_column(data, @sizeOf(Pos), 1)));
    var ii : usize = 0;
    while (ii < data.*.count) {
        pos_arr[ii].x += 1.0;
        pos_arr[ii].y += 1.0;
        std.debug.warn("{}, {}\n", pos_arr[ii].x, pos_arr[ii].y);
        ii += 1;
    }
}

pub fn main() void {
    const world = ecs.ecs_init();
    ecs.ecs_set_target_fps(world, 60);

    // Register components
    const CPos = ecs.ecs_new_component(world, c"Pos", @sizeOf(Pos));
    const SMove = ecs.ecs_type_from_entity(world, ecs.ecs_new_system(world, c"Move", ecs.EcsOnUpdate, c"Pos", move));
    const SPrint = ecs.ecs_type_from_entity(world, ecs.ecs_new_system(world, c"Print", ecs.EcsOnUpdate, c"Pos", print));

    const e = ecs._ecs_new(world, null);
    var pos = Pos {};
    _ = ecs._ecs_set_ptr(world, e, CPos, @sizeOf(Pos), &pos);

    while (true) {
        _ = ecs.ecs_progress(world, FRAME_DELTA);
    }

    ecs.ecs_fini(world);
}
