const ecs = @import("flecs");
const std = @import("std");

const Pos = struct {
    x: f32, y: f32,
};

pub fn move(rows: ecs.Rows) void {
    const pos_col = rows.getColumn(Pos, 1);
    var ii : usize = 0;
    while (ii < rows.count()) {
        pos_col[ii].x += 1.0;
        pos_col[ii].y += 1.0;
        std.debug.warn("{}\n", pos_col[ii]);
        ii += 1;
    }
}

pub fn main() !void {
    std.debug.warn("Hello\n");
    var world = ecs.World.init(std.debug.global_allocator);
    defer world.deinit();
    world.setTargetFps(60);
    const cpos = world.registerComponent(Pos);
    try world.registerSystem(c"move", ecs.Phase.OnUpdate, move, c"Pos");

    const e = world.new();
    world.set(e, cpos, Pos { .x = 0.0, .y = 0.0 });

    while (true) {
        world.progress();
    }

}

