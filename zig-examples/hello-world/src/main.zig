const ecs = @import("flecs");
const std = @import("std");

const Pos = struct {
    x: f32, y: f32,
};

pub fn move(rows: ecs.Rows) void {
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

