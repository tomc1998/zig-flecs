const ecs = @import("flecs");
const std = @import("std");

const Pos = struct { x: f32, y: f32 };

pub fn move(rows: ecs.Rows) void {
    const pos_col = rows.col(Pos);
    var ii : usize = 0;
    while (ii < rows.count()) {
        pos_col[ii].x += 1.0;
        pos_col[ii].y += 1.0;
        std.debug.warn("{}\n", pos_col[ii]);
        ii += 1;
    }
}

pub fn main() void {
    var world = ecs.World.init(std.debug.global_allocator);
    defer world.deinit();
    world.setTargetFps(60);
    world.registerComponent(Pos);
    world.registerSystem("move", ecs.Phase.OnUpdate, move, ecs.buildSig().col(Pos));

    const e = world.new(Pos { .x = 0.0, .y = 0.0 });

    while (true) {
        world.progress();
    }

}

