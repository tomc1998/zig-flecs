#!/bin/bash
zig translate-c include/flecs.h -isystem include --library c > zig-translation/flecs.zig
