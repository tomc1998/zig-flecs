#!/bin/bash
zig translate-c include/flecs.h -isystem include --library c > zig-src/c_flecs.zig
