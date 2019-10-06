const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    var exe = b.addExecutable("out", "src/main.zig");
    exe.linkSystemLibrary("c");
    exe.addPackagePath("flecs", "../../zig-src/flecs.zig");
    exe.addObjectFile("../../build/libflecs_static.a");
    b.step("run", "Run the map gen").dependOn(&exe.run().step);
}
