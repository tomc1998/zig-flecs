const flecs = @import("flecs");
const std = @import("std");

pub fn main() void {
    std.debug.warn("Hello\n");
    const world = flecs.c_flecs.ecs_init();
}
