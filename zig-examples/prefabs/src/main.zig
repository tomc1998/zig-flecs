const ecs = @import("flecs");
const std = @import("std");

const Vel = struct {
    x: f32, y: f32,
};

const Pos = struct {
    x: f32, y: f32,
};

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

    // Register the systems
    world.registerSystem("move", ecs.Phase.OnUpdate, move, ecs.buildSig().col(Pos));

    // Create a prefab
    const prefab = world.newPrefab(Pos { .x = 0.0, .y = 0.0 });

    // Instance that prefab
    const e = world.newInstance(prefab);

    while (true) {
        world.progress();
    }

}

