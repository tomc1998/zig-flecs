See [the original repository](https://github.com/SanderMertens/flecs)

# Why is this a fork?

When binding to flecs, the zig translate fails since flecs defines u8 to bool inside the header file, causing zig's translate-c to fail (since bool is restricted keyword).

The solution I chose to this was to translate-c to a file, then patch out the unnecessary typedef.

Rather than create a repo that performed the translate-c then programmatically patched (leading to immediate errors when the flecs header wasn't kept up to date), I just forked the repo.
