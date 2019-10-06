# See the original [here](https://github.com/SanderMertens/flecs)

# Why is this a fork?

When binding to flecs, the zig translate fails since flecs defines u8 to bool inside the header file, causing zig's translate-c to fail (since bool is restricted keyword).

The solution I chose to this was to translate-c to a file, then patch out the unnecessary typedef.

Rather than create a repo that performed the translate-c then programmatically patched (leading to immediate errors when the flecs header wasn't kept up to date), I just forked the repo.

# Structure of the repository

Zig examples are kept in zig-examples

Zig wrapper code is kept in zig-src

Build the flecs library with cmake, generating a static library.

Link to this static library when building your final binary, and add the zig
package zig-src/flecs.zig, for the bindings to that library.

# Building and linking into your zig project

The source in zig-src is merely a zig wrapper around the flecs API. You still
need to build and link the flecs library. To do this:

```bash
mkdir build
pushd build
cmake .. && make -j 4 flecs_static
popd
```

Now you have a `build/libflecs_static.a` file. Link to this when building your
zig project (with `LibExeObjStep.addObjectFile("/path/to/flecs/build/libflecs_static.a")`).

Then you can add the zig bindings to be built with `LibExeObjStep.addPackagePath("flecs", "/path/to/flecs/zig-src/flecs.zig")`.

Import it into your project with `@import`:

```zig
const ecs = @import("flecs");
```

# Accessing the C api

You can access the C api for anything this doesn't wrap with:

```zig
const c_flecs = @import("flecs").c_flecs;
```
