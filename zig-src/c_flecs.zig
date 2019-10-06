pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const clock_t = __clock_t;
pub const time_t = __time_t;
pub const struct_tm = extern struct {
    tm_sec: c_int,
    tm_min: c_int,
    tm_hour: c_int,
    tm_mday: c_int,
    tm_mon: c_int,
    tm_year: c_int,
    tm_wday: c_int,
    tm_yday: c_int,
    tm_isdst: c_int,
    tm_gmtoff: c_long,
    tm_zone: [*c]const u8,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const clockid_t = __clockid_t;
pub const timer_t = __timer_t;
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec,
    it_value: struct_timespec,
};
pub const struct_sigevent = @OpaqueType();
pub const pid_t = __pid_t;
pub const struct___locale_data = @OpaqueType();
pub const struct___locale_struct = extern struct {
    __locales: [13](?*struct___locale_data),
    __ctype_b: [*c]const c_ushort,
    __ctype_tolower: [*c]const c_int,
    __ctype_toupper: [*c]const c_int,
    __names: [13]([*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn clock() clock_t;
pub extern fn time(__timer: [*c]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: [*c]struct_tm) time_t;
pub extern fn strftime(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm) usize;
pub extern fn strftime_l(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm, __loc: locale_t) usize;
pub extern fn gmtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn asctime(__tp: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(__timer: [*c]const time_t) [*c]u8;
pub extern fn asctime_r(noalias __tp: [*c]const struct_tm, noalias __buf: [*c]u8) [*c]u8;
pub extern fn ctime_r(noalias __timer: [*c]const time_t, noalias __buf: [*c]u8) [*c]u8;
pub extern var __tzname: [2]([*c]u8);
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2]([*c]u8);
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn stime(__when: [*c]const time_t) c_int;
pub extern fn timegm(__tp: [*c]struct_tm) time_t;
pub extern fn timelocal(__tp: [*c]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: [*c]const struct_timespec, __rem: [*c]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: [*c]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: ?*struct_sigevent, noalias __timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: [*c]const struct_itimerspec, noalias __ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub const wchar_t = c_int;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub const div_t = extern struct {
    quot: c_int,
    rem: c_int,
};
pub const ldiv_t = extern struct {
    quot: c_long,
    rem: c_long,
};
pub const lldiv_t = extern struct {
    quot: c_longlong,
    rem: c_longlong,
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c]([*c]u8)) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c]([*c]u8)) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c]([*c]u8)) c_longdouble;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c]([*c]u8), __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c]([*c]u8), __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c]([*c]u8), __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c]([*c]u8), __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c]([*c]u8), __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c]([*c]u8), __base: c_int) c_ulonglong;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const off_t = __off_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(__bsx: __uint16_t) __uint16_t {
    return __uint16_t(((c_int(__bsx) >> @import("std").math.Log2Int(c_int)(8)) & 255) | ((c_int(__bsx) & 255) << @import("std").math.Log2Int(c_int)(8)));
}
pub fn __bswap_32(__bsx: __uint32_t) __uint32_t {
    return ((((__bsx & 4278190080) >> @import("std").math.Log2Int(c_uint)(24)) | ((__bsx & 16711680) >> @import("std").math.Log2Int(c_uint)(8))) | ((__bsx & 65280) << @import("std").math.Log2Int(c_uint)(8))) | ((__bsx & 255) << @import("std").math.Log2Int(c_uint)(24));
}
pub fn __bswap_64(__bsx: __uint64_t) __uint64_t {
    return __uint64_t(((((((((c_ulonglong(__bsx) & 18374686479671623680) >> @import("std").math.Log2Int(c_ulonglong)(56)) | ((c_ulonglong(__bsx) & 71776119061217280) >> @import("std").math.Log2Int(c_ulonglong)(40))) | ((c_ulonglong(__bsx) & 280375465082880) >> @import("std").math.Log2Int(c_ulonglong)(24))) | ((c_ulonglong(__bsx) & 1095216660480) >> @import("std").math.Log2Int(c_ulonglong)(8))) | ((c_ulonglong(__bsx) & 4278190080) << @import("std").math.Log2Int(c_ulonglong)(8))) | ((c_ulonglong(__bsx) & 16711680) << @import("std").math.Log2Int(c_ulonglong)(24))) | ((c_ulonglong(__bsx) & 65280) << @import("std").math.Log2Int(c_ulonglong)(40))) | ((c_ulonglong(__bsx) & 255) << @import("std").math.Log2Int(c_ulonglong)(56)));
}
pub fn __uint16_identity(__x: __uint16_t) __uint16_t {
    return __x;
}
pub fn __uint32_identity(__x: __uint32_t) __uint32_t {
    return __x;
}
pub fn __uint64_identity(__x: __uint64_t) __uint64_t {
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong,
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t,
    tv_usec: __suseconds_t,
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask,
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list,
    __next: [*c]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_cond_s = extern struct {
    @"": extern union {
        __wseq: c_ulonglong,
        __wseq32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    @"": extern union {
        __g1_start: c_ulonglong,
        __g1_start32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32,
    rptr: [*c]i32,
    state: [*c]i32,
    rand_type: c_int,
    rand_deg: c_int,
    rand_sep: c_int,
    end_ptr: [*c]i32,
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort,
    __old_x: [3]c_ushort,
    __c: c_ushort,
    __init: c_ushort,
    __a: c_ulonglong,
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn malloc(__size: c_ulong) ?*c_void;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*c_void;
pub extern fn realloc(__ptr: ?*c_void, __size: c_ulong) ?*c_void;
pub extern fn reallocarray(__ptr: ?*c_void, __nmemb: usize, __size: usize) ?*c_void;
pub extern fn free(__ptr: ?*c_void) void;
pub extern fn alloca(__size: c_ulong) ?*c_void;
pub extern fn valloc(__size: usize) ?*c_void;
pub extern fn posix_memalign(__memptr: [*c](?*c_void), __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: usize, __size: usize) ?*c_void;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?extern fn () void) c_int;
pub extern fn at_quick_exit(__func: ?extern fn () void) c_int;
pub extern fn on_exit(__func: ?extern fn (c_int, ?*c_void) void, __arg: ?*c_void) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?extern fn (?*const c_void, ?*const c_void) c_int;
pub extern fn bsearch(__key: ?*const c_void, __base: ?*const c_void, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*c_void;
pub extern fn qsort(__base: ?*c_void, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c]([*c]u8), noalias __tokens: [*c]const ([*c]u8), noalias __valuep: [*c]([*c]u8)) c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub const struct___va_list_tag = extern struct {
    gp_offset: c_uint,
    fp_offset: c_uint,
    overflow_arg_area: ?*c_void,
    reg_save_area: ?*c_void,
};
pub const __builtin_va_list = [1]struct___va_list_tag;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
pub const __mbstate_t = extern struct {
    __count: c_int,
    __value: extern union {
        __wch: c_uint,
        __wchb: [4]u8,
    },
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t,
    __state: __mbstate_t,
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t,
    __state: __mbstate_t,
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = @OpaqueType();
pub const _IO_lock_t = c_void;
pub const struct__IO_codecvt = @OpaqueType();
pub const struct__IO_wide_data = @OpaqueType();
pub const struct__IO_FILE = extern struct {
    _flags: c_int,
    _IO_read_ptr: [*c]u8,
    _IO_read_end: [*c]u8,
    _IO_read_base: [*c]u8,
    _IO_write_base: [*c]u8,
    _IO_write_ptr: [*c]u8,
    _IO_write_end: [*c]u8,
    _IO_buf_base: [*c]u8,
    _IO_buf_end: [*c]u8,
    _IO_save_base: [*c]u8,
    _IO_backup_base: [*c]u8,
    _IO_save_end: [*c]u8,
    _markers: ?*struct__IO_marker,
    _chain: [*c]struct__IO_FILE,
    _fileno: c_int,
    _flags2: c_int,
    _old_offset: __off_t,
    _cur_column: c_ushort,
    _vtable_offset: i8,
    _shortbuf: [1]u8,
    _lock: ?*_IO_lock_t,
    _offset: __off64_t,
    _codecvt: ?*struct__IO_codecvt,
    _wide_data: ?*struct__IO_wide_data,
    _freeres_list: [*c]struct__IO_FILE,
    _freeres_buf: ?*c_void,
    __pad5: usize,
    _mode: c_int,
    _unused2: [20]u8,
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const fpos_t = __fpos_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam(__s: [*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fmemopen(__s: ?*c_void, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c]([*c]u8), __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(__s: [*c]u8, __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(__s: [*c]FILE, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vprintf(__format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vsprintf(__s: [*c]u8, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn snprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(__s: [*c]u8, __maxlen: c_ulong, __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c]([*c]u8), noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c]([*c]u8), noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c]([*c]u8), noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*c_void, __size: c_ulong, __n: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn fwrite(__ptr: ?*const c_void, __size: c_ulong, __n: c_ulong, __s: [*c]FILE) c_ulong;
pub extern fn fread_unlocked(noalias __ptr: ?*c_void, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const c_void, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub extern fn feof_unlocked(__stream: [*c]FILE) c_int;
pub extern fn ferror_unlocked(__stream: [*c]FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern var sys_nerr: c_int;
pub extern const sys_errlist: [*c]const ([*c]const u8);
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow(arg0: [*c]FILE) c_int;
pub extern fn __overflow(arg0: [*c]FILE, arg1: c_int) c_int;
pub extern fn __assert_fail(__assertion: [*c]const u8, __file: [*c]const u8, __line: c_uint, __function: [*c]const u8) noreturn;
pub extern fn __assert_perror_fail(__errnum: c_int, __file: [*c]const u8, __line: c_uint, __function: [*c]const u8) noreturn;
pub extern fn __assert(__assertion: [*c]const u8, __file: [*c]const u8, __line: c_int) noreturn;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const struct_ecs_world = @OpaqueType();
pub const ecs_world_t = struct_ecs_world;
pub const ecs_entity_t = u64;
pub const struct_ecs_time_t = extern struct {
    sec: i32,
    nanosec: u32,
};
pub const ecs_time_t = struct_ecs_time_t;
pub const ecs_os_thread_t = usize;
pub const ecs_os_cond_t = usize;
pub const ecs_os_mutex_t = usize;
pub const ecs_os_dl_t = usize;
pub const ecs_os_proc_t = ?extern fn () void;
pub const ecs_os_api_malloc_t = ?extern fn (usize) ?*c_void;
pub const ecs_os_api_free_t = ?extern fn (?*c_void) void;
pub const ecs_os_api_realloc_t = ?extern fn (?*c_void, usize) ?*c_void;
pub const ecs_os_api_calloc_t = ?extern fn (usize, usize) ?*c_void;
pub const ecs_os_thread_callback_t = ?extern fn (?*c_void) ?*c_void;
pub const ecs_os_api_thread_new_t = ?extern fn (ecs_os_thread_callback_t, ?*c_void) ecs_os_thread_t;
pub const ecs_os_api_thread_join_t = ?extern fn (ecs_os_thread_t) ?*c_void;
pub const ecs_os_api_mutex_new_t = ?extern fn () ecs_os_mutex_t;
pub const ecs_os_api_mutex_lock_t = ?extern fn (ecs_os_mutex_t) void;
pub const ecs_os_api_mutex_unlock_t = ?extern fn (ecs_os_mutex_t) void;
pub const ecs_os_api_mutex_free_t = ?extern fn (ecs_os_mutex_t) void;
pub const ecs_os_api_cond_new_t = ?extern fn () ecs_os_cond_t;
pub const ecs_os_api_cond_free_t = ?extern fn (ecs_os_cond_t) void;
pub const ecs_os_api_cond_signal_t = ?extern fn (ecs_os_cond_t) void;
pub const ecs_os_api_cond_broadcast_t = ?extern fn (ecs_os_cond_t) void;
pub const ecs_os_api_cond_wait_t = ?extern fn (ecs_os_cond_t, ecs_os_mutex_t) void;
pub const ecs_os_api_sleep_t = ?extern fn (u32, u32) void;
pub const ecs_os_api_get_time_t = ?extern fn ([*c]ecs_time_t) void;
pub const ecs_os_api_log_t = ?extern fn ([*c]const u8, [*c]struct___va_list_tag) void;
pub const ecs_os_api_abort_t = ?extern fn () void;
pub const ecs_os_api_dlopen_t = ?extern fn ([*c]const u8) ecs_os_dl_t;
pub const ecs_os_api_dlproc_t = ?extern fn (ecs_os_dl_t, [*c]const u8) ecs_os_proc_t;
pub const ecs_os_api_dlclose_t = ?extern fn (ecs_os_dl_t) void;
pub const ecs_os_api_module_to_dl_t = ?extern fn ([*c]const u8) [*c]u8;
pub const struct_ecs_os_api_t = extern struct {
    malloc: ecs_os_api_malloc_t,
    realloc: ecs_os_api_realloc_t,
    calloc: ecs_os_api_calloc_t,
    free: ecs_os_api_free_t,
    thread_new: ecs_os_api_thread_new_t,
    thread_join: ecs_os_api_thread_join_t,
    mutex_new: ecs_os_api_mutex_new_t,
    mutex_free: ecs_os_api_mutex_free_t,
    mutex_lock: ecs_os_api_mutex_lock_t,
    mutex_unlock: ecs_os_api_mutex_lock_t,
    cond_new: ecs_os_api_cond_new_t,
    cond_free: ecs_os_api_cond_free_t,
    cond_signal: ecs_os_api_cond_signal_t,
    cond_broadcast: ecs_os_api_cond_broadcast_t,
    cond_wait: ecs_os_api_cond_wait_t,
    sleep: ecs_os_api_sleep_t,
    get_time: ecs_os_api_get_time_t,
    log: ecs_os_api_log_t,
    log_error: ecs_os_api_log_t,
    log_debug: ecs_os_api_log_t,
    log_warning: ecs_os_api_log_t,
    abort: ecs_os_api_abort_t,
    dlopen: ecs_os_api_dlopen_t,
    dlproc: ecs_os_api_dlproc_t,
    dlclose: ecs_os_api_dlclose_t,
    module_to_dl: ecs_os_api_module_to_dl_t,
};
pub const ecs_os_api_t = struct_ecs_os_api_t;
pub extern var ecs_os_api: ecs_os_api_t;
pub extern fn ecs_os_set_api(os_api: [*c]ecs_os_api_t) void;
pub extern fn ecs_os_set_api_defaults() void;
pub extern fn ecs_os_log(fmt: [*c]const u8, ...) void;
pub extern fn ecs_os_warn(fmt: [*c]const u8, ...) void;
pub extern fn ecs_os_err(fmt: [*c]const u8, ...) void;
pub extern fn ecs_os_dbg(fmt: [*c]const u8, ...) void;
pub extern fn ecs_os_enable_dbg(enable: bool) void;
pub extern fn ecs_os_dbg_enabled() bool;
pub extern fn ecs_sleepf(t: f64) void;
pub extern fn ecs_time_measure(start: [*c]ecs_time_t) f64;
pub const struct_ecs_vector_t = @OpaqueType();
pub const ecs_vector_t = struct_ecs_vector_t;
pub const ecs_vector_params_t = struct_ecs_vector_params_t;
pub const EcsMove = ?extern fn (?*ecs_vector_t, [*c]const ecs_vector_params_t, ?*c_void, ?*c_void, ?*c_void) void;
pub const struct_ecs_vector_params_t = extern struct {
    move_action: EcsMove,
    move_ctx: ?*c_void,
    ctx: ?*c_void,
    element_size: u32,
};
pub const EcsComparator = ?extern fn (?*const c_void, ?*const c_void) c_int;
pub extern fn ecs_vector_new(params: [*c]const ecs_vector_params_t, size: u32) ?*ecs_vector_t;
pub extern fn ecs_vector_new_from_buffer(params: [*c]const ecs_vector_params_t, size: u32, buffer: ?*c_void) ?*ecs_vector_t;
pub extern fn ecs_vector_free(array: ?*ecs_vector_t) void;
pub extern fn ecs_vector_clear(array: ?*ecs_vector_t) void;
pub extern fn ecs_vector_add(array_inout: [*c](?*ecs_vector_t), params: [*c]const ecs_vector_params_t) ?*c_void;
pub extern fn ecs_vector_addn(array_inout: [*c](?*ecs_vector_t), params: [*c]const ecs_vector_params_t, count: u32) ?*c_void;
pub extern fn ecs_vector_get(array: ?*const ecs_vector_t, params: [*c]const ecs_vector_params_t, index: u32) ?*c_void;
pub extern fn ecs_vector_get_index(array: ?*const ecs_vector_t, params: [*c]const ecs_vector_params_t, elem: ?*c_void) u32;
pub extern fn ecs_vector_last(array: ?*const ecs_vector_t, params: [*c]const ecs_vector_params_t) ?*c_void;
pub extern fn ecs_vector_remove(array: ?*ecs_vector_t, params: [*c]const ecs_vector_params_t, elem: ?*c_void) u32;
pub extern fn ecs_vector_remove_last(array: ?*ecs_vector_t) void;
pub extern fn ecs_vector_pop(array: ?*ecs_vector_t, params: [*c]const ecs_vector_params_t, value: ?*c_void) bool;
pub extern fn ecs_vector_move_index(dst_array: [*c](?*ecs_vector_t), src_array: ?*ecs_vector_t, params: [*c]const ecs_vector_params_t, index: u32) u32;
pub extern fn ecs_vector_remove_index(array: ?*ecs_vector_t, params: [*c]const ecs_vector_params_t, index: u32) u32;
pub extern fn ecs_vector_reclaim(array: [*c](?*ecs_vector_t), params: [*c]const ecs_vector_params_t) void;
pub extern fn ecs_vector_set_size(array: [*c](?*ecs_vector_t), params: [*c]const ecs_vector_params_t, size: u32) u32;
pub extern fn ecs_vector_set_count(array: [*c](?*ecs_vector_t), params: [*c]const ecs_vector_params_t, size: u32) u32;
pub extern fn ecs_vector_count(array: ?*const ecs_vector_t) u32;
pub extern fn ecs_vector_size(array: ?*const ecs_vector_t) u32;
pub extern fn ecs_vector_first(array: ?*const ecs_vector_t) ?*c_void;
pub extern fn ecs_vector_sort(array: ?*ecs_vector_t, params: [*c]const ecs_vector_params_t, compare_action: EcsComparator) void;
pub extern fn ecs_vector_memory(array: ?*const ecs_vector_t, params: [*c]const ecs_vector_params_t, allocd: [*c]u32, used: [*c]u32) void;
pub const struct_ecs_chunked_t = @OpaqueType();
pub const ecs_chunked_t = struct_ecs_chunked_t;
pub extern fn _ecs_chunked_new(element_size: u32, chunk_size: u32, chunk_count: u32) ?*ecs_chunked_t;
pub extern fn ecs_chunked_free(chunked: ?*ecs_chunked_t) void;
pub extern fn ecs_chunked_clear(chunked: ?*ecs_chunked_t) void;
pub extern fn _ecs_chunked_add(chunked: ?*ecs_chunked_t, size: u32) ?*c_void;
pub extern fn _ecs_chunked_remove(chunked: ?*ecs_chunked_t, size: u32, index: u32) ?*c_void;
pub extern fn _ecs_chunked_get(chunked: ?*const ecs_chunked_t, size: u32, index: u32) ?*c_void;
pub extern fn ecs_chunked_count(chunked: ?*const ecs_chunked_t) u32;
pub extern fn _ecs_chunked_get_sparse(chunked: ?*const ecs_chunked_t, size: u32, index: u32) ?*c_void;
pub extern fn ecs_chunked_indices(chunked: ?*const ecs_chunked_t) [*c]const u32;
pub extern fn ecs_chunked_memory(chunked: ?*ecs_chunked_t, allocd: [*c]u32, used: [*c]u32) void;
pub const struct_ecs_map_t = @OpaqueType();
pub const ecs_map_t = struct_ecs_map_t;
pub const struct_ecs_map_iter_t = extern struct {
    map: ?*ecs_map_t,
    bucket_index: u32,
    node: u32,
};
pub const ecs_map_iter_t = struct_ecs_map_iter_t;
pub extern fn ecs_map_new(size: u32, elem_size: u32) ?*ecs_map_t;
pub extern fn ecs_map_free(map: ?*ecs_map_t) void;
pub extern fn ecs_map_memory(map: ?*ecs_map_t, total: [*c]u32, used: [*c]u32) void;
pub extern fn ecs_map_count(map: ?*ecs_map_t) u32;
pub extern fn ecs_map_set_size(map: ?*ecs_map_t, size: u32) u32;
pub extern fn ecs_map_data_size(map: ?*ecs_map_t) u32;
pub extern fn ecs_map_grow(map: ?*ecs_map_t, size: u32) u32;
pub extern fn ecs_map_bucket_count(map: ?*ecs_map_t) u32;
pub extern fn ecs_map_clear(map: ?*ecs_map_t) void;
pub extern fn _ecs_map_set(map: ?*ecs_map_t, key_hash: u64, data: ?*const c_void, size: u32) ?*c_void;
pub extern fn _ecs_map_has(map: ?*ecs_map_t, key_hash: u64, value_out: ?*c_void, size: u32) bool;
pub extern fn ecs_map_get_ptr(map: ?*ecs_map_t, key_hash: u64) ?*c_void;
pub extern fn ecs_map_remove(map: ?*ecs_map_t, key_hash: u64) c_int;
pub extern fn ecs_map_iter(map: ?*ecs_map_t) ecs_map_iter_t;
pub extern fn ecs_map_hasnext(it: [*c]ecs_map_iter_t) bool;
pub extern fn ecs_map_next(it: [*c]ecs_map_iter_t) ?*c_void;
pub extern fn ecs_map_next_w_size(it: [*c]ecs_map_iter_t, size: usize) ?*c_void;
pub extern fn ecs_map_next_w_key(it: [*c]ecs_map_iter_t, key_out: [*c]u64) ?*c_void;
pub extern fn ecs_map_next_w_key_w_size(it: [*c]ecs_map_iter_t, key_out: [*c]u64, size: usize) ?*c_void;
pub const struct_EcsSystemStats = extern struct {
    handle: ecs_entity_t,
    id: [*c]const u8,
    signature: [*c]const u8,
    tables_matched: u32,
    entities_matched: u32,
    period: f32,
    time_spent: f32,
    enabled: bool,
    active: bool,
    is_hidden: bool,
};
pub const EcsSystemStats = struct_EcsSystemStats;
pub const struct_EcsFeatureStats = extern struct {
    id: [*c]const u8,
    entities: [*c]u8,
    system_count: u32,
    systems_enabled: u32,
    is_hidden: bool,
};
pub const EcsFeatureStats = struct_EcsFeatureStats;
pub const struct_EcsComponentStats = extern struct {
    handle: ecs_entity_t,
    id: [*c]const u8,
    size: u16,
    memory_used: u32,
    memory_allocd: u32,
    entities: u32,
    tables: u32,
};
pub const EcsComponentStats = struct_EcsComponentStats;
pub const struct_EcsMemoryStat = extern struct {
    allocd: u32,
    used: u32,
};
pub const EcsMemoryStat = struct_EcsMemoryStat;
pub const struct_EcsMemoryStats = extern struct {
    total: EcsMemoryStat,
    components: EcsMemoryStat,
    entities: EcsMemoryStat,
    systems: EcsMemoryStat,
    families: EcsMemoryStat,
    tables: EcsMemoryStat,
    stage: EcsMemoryStat,
    world: EcsMemoryStat,
};
pub const EcsMemoryStats = struct_EcsMemoryStats;
pub const struct_ecs_world_stats_t = extern struct {
    system_count: u32,
    table_count: u32,
    component_count: u32,
    entity_count: u32,
    thread_count: u32,
    tick_count: u32,
    system_time: f32,
    frame_time: f32,
    merge_time: f32,
    memory: EcsMemoryStats,
    features: ?*ecs_vector_t,
    on_load_systems: ?*ecs_vector_t,
    post_load_systems: ?*ecs_vector_t,
    pre_update_systems: ?*ecs_vector_t,
    on_update_systems: ?*ecs_vector_t,
    on_validate_systems: ?*ecs_vector_t,
    post_update_systems: ?*ecs_vector_t,
    pre_store_systems: ?*ecs_vector_t,
    on_store_systems: ?*ecs_vector_t,
    task_systems: ?*ecs_vector_t,
    inactive_systems: ?*ecs_vector_t,
    on_demand_systems: ?*ecs_vector_t,
    on_add_systems: ?*ecs_vector_t,
    on_remove_systems: ?*ecs_vector_t,
    on_set_systems: ?*ecs_vector_t,
    components: ?*ecs_vector_t,
    frame_profiling: bool,
    system_profiling: bool,
};
pub const ecs_world_stats_t = struct_ecs_world_stats_t;
pub extern fn ecs_get_stats(world: ?*ecs_world_t, stats: [*c]ecs_world_stats_t) void;
pub extern fn ecs_free_stats(stats: [*c]ecs_world_stats_t) void;
pub extern fn ecs_measure_frame_time(world: ?*ecs_world_t, enable: bool) void;
pub extern fn ecs_measure_system_time(world: ?*ecs_world_t, enable: bool) void;
pub const ecs_type_t = ?*const ecs_vector_t;
pub const EcsId = [*c]const u8;
pub const struct_EcsComponent = extern struct {
    size: u32,
};
pub const EcsComponent = struct_EcsComponent;
pub const struct_EcsPrefab = extern struct {
    parent: ecs_entity_t,
};
pub const EcsPrefab = struct_EcsPrefab;
pub const EcsOnLoad = enum_EcsSystemKind.EcsOnLoad;
pub const EcsPostLoad = enum_EcsSystemKind.EcsPostLoad;
pub const EcsPreUpdate = enum_EcsSystemKind.EcsPreUpdate;
pub const EcsOnUpdate = enum_EcsSystemKind.EcsOnUpdate;
pub const EcsOnValidate = enum_EcsSystemKind.EcsOnValidate;
pub const EcsPostUpdate = enum_EcsSystemKind.EcsPostUpdate;
pub const EcsPreStore = enum_EcsSystemKind.EcsPreStore;
pub const EcsOnStore = enum_EcsSystemKind.EcsOnStore;
pub const EcsManual = enum_EcsSystemKind.EcsManual;
pub const EcsOnAdd = enum_EcsSystemKind.EcsOnAdd;
pub const EcsOnRemove = enum_EcsSystemKind.EcsOnRemove;
pub const EcsOnSet = enum_EcsSystemKind.EcsOnSet;
pub const enum_EcsSystemKind = extern enum {
    EcsOnLoad,
    EcsPostLoad,
    EcsPreUpdate,
    EcsOnUpdate,
    EcsOnValidate,
    EcsPostUpdate,
    EcsPreStore,
    EcsOnStore,
    EcsManual,
    EcsOnAdd,
    EcsOnRemove,
    EcsOnSet,
};
pub const EcsSystemKind = enum_EcsSystemKind;
pub const struct_ecs_reference_t = extern struct {
    entity: ecs_entity_t,
    component: ecs_entity_t,
    cached_ptr: ?*c_void,
};
pub const ecs_reference_t = struct_ecs_reference_t;
pub const struct_ecs_rows_t = extern struct {
    world: ?*ecs_world_t,
    system: ecs_entity_t,
    columns: [*c]i32,
    column_count: u16,
    table: ?*c_void,
    table_columns: ?*c_void,
    references: [*c]ecs_reference_t,
    components: [*c]ecs_entity_t,
    entities: [*c]ecs_entity_t,
    param: ?*c_void,
    delta_time: f32,
    world_time: f32,
    frame_offset: u32,
    offset: u32,
    count: u32,
    interrupted_by: ecs_entity_t,
};
pub const ecs_rows_t = struct_ecs_rows_t;
pub const EcsMatchDefault = enum_ecs_type_filter_kind_t.EcsMatchDefault;
pub const EcsMatchAll = enum_ecs_type_filter_kind_t.EcsMatchAll;
pub const EcsMatchAny = enum_ecs_type_filter_kind_t.EcsMatchAny;
pub const EcsMatchExact = enum_ecs_type_filter_kind_t.EcsMatchExact;
pub const enum_ecs_type_filter_kind_t = extern enum {
    EcsMatchDefault = 0,
    EcsMatchAll = 1,
    EcsMatchAny = 2,
    EcsMatchExact = 3,
};
pub const ecs_type_filter_kind_t = enum_ecs_type_filter_kind_t;
pub const struct_ecs_type_filter_t = extern struct {
    include: ecs_type_t,
    exclude: ecs_type_t,
    include_kind: ecs_type_filter_kind_t,
    exclude_kind: ecs_type_filter_kind_t,
};
pub const ecs_type_filter_t = struct_ecs_type_filter_t;
pub const ecs_system_action_t = ?extern fn ([*c]ecs_rows_t) void;
pub const ecs_module_init_action_t = ?extern fn (?*ecs_world_t, c_int) void;
pub extern var TEcsComponent: ecs_type_t;
pub extern var TEcsTypeComponent: ecs_type_t;
pub extern var TEcsPrefab: ecs_type_t;
pub extern var TEcsPrefabParent: ecs_type_t;
pub extern var TEcsPrefabBuilder: ecs_type_t;
pub extern var TEcsRowSystem: ecs_type_t;
pub extern var TEcsColSystem: ecs_type_t;
pub extern var TEcsId: ecs_type_t;
pub extern var TEcsHidden: ecs_type_t;
pub extern var TEcsDisabled: ecs_type_t;
pub extern var ECS_COMPONENT_ID: [*c]const u8;
pub extern var ECS_TYPE_COMPONENT_ID: [*c]const u8;
pub extern var ECS_PREFAB_ID: [*c]const u8;
pub extern var ECS_PREFAB_PARENT_ID: [*c]const u8;
pub extern var ECS_ROW_SYSTEM_ID: [*c]const u8;
pub extern var ECS_COL_SYSTEM_ID: [*c]const u8;
pub extern var ECS_ID_ID: [*c]const u8;
pub extern var ECS_HIDDEN_ID: [*c]const u8;
pub extern var ECS_CONTAINER_ID: [*c]const u8;
pub extern var ECS_DISABLED_ID: [*c]const u8;
pub extern fn ecs_init() ?*ecs_world_t;
pub extern fn ecs_init_w_args(argc: c_int, argv: [*c]([*c]u8)) ?*ecs_world_t;
pub extern fn ecs_fini(world: ?*ecs_world_t) c_int;
pub extern fn ecs_quit(world: ?*ecs_world_t) void;
pub extern fn _ecs_import(world: ?*ecs_world_t, module: ecs_module_init_action_t, module_name: [*c]const u8, flags: c_int, handles_out: ?*c_void, handles_size: usize) ecs_entity_t;
pub extern fn ecs_import_from_library(world: ?*ecs_world_t, library_name: [*c]const u8, module_name: [*c]const u8, flags: c_int) ecs_entity_t;
pub extern fn ecs_progress(world: ?*ecs_world_t, delta_time: f32) bool;
pub extern fn ecs_merge(world: ?*ecs_world_t) void;
pub extern fn ecs_set_automerge(world: ?*ecs_world_t, auto_merge: bool) void;
pub extern fn ecs_set_threads(world: ?*ecs_world_t, threads: u32) void;
pub extern fn ecs_get_threads(world: ?*ecs_world_t) u32;
pub extern fn ecs_get_thread_index(world: ?*ecs_world_t) u16;
pub extern fn ecs_set_target_fps(world: ?*ecs_world_t, fps: f32) void;
pub extern fn ecs_get_target_fps(world: ?*ecs_world_t) u32;
pub extern fn ecs_enable_admin(world: ?*ecs_world_t, port: u16) c_int;
pub extern fn ecs_get_delta_time(world: ?*ecs_world_t) f32;
pub extern fn ecs_set_context(world: ?*ecs_world_t, ctx: ?*c_void) void;
pub extern fn ecs_get_context(world: ?*ecs_world_t) ?*c_void;
pub extern fn ecs_get_tick(world: ?*ecs_world_t) u32;
pub extern fn ecs_dim(world: ?*ecs_world_t, entity_count: u32) void;
pub extern fn _ecs_dim_type(world: ?*ecs_world_t, type_0: ecs_type_t, entity_count: u32) void;
pub extern fn ecs_set_entity_range(world: ?*ecs_world_t, id_start: ecs_entity_t, id_end: ecs_entity_t) void;
pub extern fn ecs_enable_range_check(world: ?*ecs_world_t, enable: bool) bool;
pub extern fn _ecs_new(world: ?*ecs_world_t, type_0: ecs_type_t) ecs_entity_t;
pub extern fn _ecs_new_w_count(world: ?*ecs_world_t, type_0: ecs_type_t, count: u32) ecs_entity_t;
pub const ecs_table_columns_t = ?*c_void;
pub const struct_ecs_table_data_t = extern struct {
    row_count: u32,
    column_count: u32,
    entities: [*c]ecs_entity_t,
    components: [*c]ecs_entity_t,
    columns: [*c]ecs_table_columns_t,
};
pub const ecs_table_data_t = struct_ecs_table_data_t;
pub extern fn ecs_set_w_data(world: ?*ecs_world_t, data: [*c]ecs_table_data_t) ecs_entity_t;
pub extern fn _ecs_new_child(world: ?*ecs_world_t, parent: ecs_entity_t, type_0: ecs_type_t) ecs_entity_t;
pub extern fn _ecs_new_child_w_count(world: ?*ecs_world_t, parent: ecs_entity_t, type_0: ecs_type_t, count: u32) ecs_entity_t;
pub extern fn _ecs_new_instance(world: ?*ecs_world_t, base: ecs_entity_t, type_0: ecs_type_t) ecs_entity_t;
pub extern fn _ecs_new_instance_w_count(world: ?*ecs_world_t, base: ecs_entity_t, type_0: ecs_type_t, count: u32) ecs_entity_t;
pub extern fn ecs_clone(world: ?*ecs_world_t, entity: ecs_entity_t, copy_value: bool) ecs_entity_t;
pub extern fn ecs_delete(world: ?*ecs_world_t, entity: ecs_entity_t) void;
pub extern fn ecs_delete_w_filter(world: ?*ecs_world_t, filter: [*c]ecs_type_filter_t) void;
pub extern fn _ecs_add(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) void;
pub extern fn _ecs_remove(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) void;
pub extern fn _ecs_add_remove(world: ?*ecs_world_t, entity: ecs_entity_t, to_add: ecs_type_t, to_remove: ecs_type_t) void;
pub extern fn ecs_adopt(world: ?*ecs_world_t, entity: ecs_entity_t, parent: ecs_entity_t) void;
pub extern fn ecs_orphan(world: ?*ecs_world_t, entity: ecs_entity_t, parent: ecs_entity_t) void;
pub extern fn ecs_inherit(world: ?*ecs_world_t, entity: ecs_entity_t, base: ecs_entity_t) void;
pub extern fn ecs_disinherit(world: ?*ecs_world_t, entity: ecs_entity_t, base: ecs_entity_t) void;
pub extern fn _ecs_add_remove_w_filter(world: ?*ecs_world_t, to_add: ecs_type_t, to_remove: ecs_type_t, filter: [*c]ecs_type_filter_t) void;
pub extern fn _ecs_get_ptr(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) ?*c_void;
pub extern fn _ecs_set_ptr(world: ?*ecs_world_t, entity: ecs_entity_t, component: ecs_entity_t, size: usize, ptr: ?*c_void) ecs_entity_t;
pub extern fn _ecs_set_singleton_ptr(world: ?*ecs_world_t, component: ecs_entity_t, size: usize, ptr: ?*c_void) ecs_entity_t;
pub extern fn _ecs_has(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) bool;
pub extern fn _ecs_has_owned(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) bool;
pub extern fn _ecs_has_any(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) bool;
pub extern fn _ecs_has_any_owned(world: ?*ecs_world_t, entity: ecs_entity_t, type_0: ecs_type_t) bool;
pub extern fn ecs_has_entity(world: ?*ecs_world_t, entity: ecs_entity_t, component: ecs_entity_t) bool;
pub extern fn ecs_contains(world: ?*ecs_world_t, parent: ecs_entity_t, child: ecs_entity_t) bool;
pub extern fn _ecs_get_parent(world: ?*ecs_world_t, entity: ecs_entity_t, component: ecs_entity_t) ecs_entity_t;
pub extern fn ecs_get_type(world: ?*ecs_world_t, entity: ecs_entity_t) ecs_type_t;
pub extern fn ecs_get_id(world: ?*ecs_world_t, entity: ecs_entity_t) [*c]const u8;
pub extern fn ecs_is_empty(world: ?*ecs_world_t, entity: ecs_entity_t) bool;
pub extern fn _ecs_count(world: ?*ecs_world_t, type_0: ecs_type_t) u32;
pub extern fn ecs_lookup(world: ?*ecs_world_t, id: [*c]const u8) ecs_entity_t;
pub extern fn ecs_lookup_child(world: ?*ecs_world_t, parent: ecs_entity_t, id: [*c]const u8) ecs_entity_t;
pub extern fn ecs_type_from_entity(world: ?*ecs_world_t, entity: ecs_entity_t) ecs_type_t;
pub extern fn ecs_type_to_entity(world: ?*ecs_world_t, type_0: ecs_type_t) ecs_entity_t;
pub extern fn ecs_type_add(world: ?*ecs_world_t, type_0: ecs_type_t, entity: ecs_entity_t) ecs_type_t;
pub extern fn ecs_type_merge(world: ?*ecs_world_t, type_0: ecs_type_t, type_add: ecs_type_t, type_remove: ecs_type_t) ecs_type_t;
pub extern fn ecs_type_find(world: ?*ecs_world_t, array: [*c]ecs_entity_t, count: u32) ecs_type_t;
pub extern fn ecs_type_get_entity(world: ?*ecs_world_t, type_0: ecs_type_t, index: u32) ecs_entity_t;
pub extern fn ecs_type_has_entity(world: ?*ecs_world_t, type_0: ecs_type_t, entity: ecs_entity_t) bool;
pub extern fn ecs_expr_to_type(world: ?*ecs_world_t, expr: [*c]const u8) ecs_type_t;
pub extern fn ecs_type_to_expr(world: ?*ecs_world_t, type_0: ecs_type_t) [*c]u8;
pub extern fn ecs_type_match_w_filter(world: ?*ecs_world_t, type_0: ecs_type_t, filter: [*c]ecs_type_filter_t) bool;
pub extern fn ecs_enable(world: ?*ecs_world_t, system_0: ecs_entity_t, enabled: bool) void;
pub extern fn ecs_set_period(world: ?*ecs_world_t, system_0: ecs_entity_t, period: f32) void;
pub extern fn ecs_is_enabled(world: ?*ecs_world_t, system_0: ecs_entity_t) bool;
pub extern fn ecs_run(world: ?*ecs_world_t, system_0: ecs_entity_t, delta_time: f32, param: ?*c_void) ecs_entity_t;
pub extern fn _ecs_run_w_filter(world: ?*ecs_world_t, system_0: ecs_entity_t, delta_time: f32, offset: u32, limit: u32, filter: ecs_type_t, param: ?*c_void) ecs_entity_t;
pub extern fn ecs_set_system_context(world: ?*ecs_world_t, system_0: ecs_entity_t, ctx: ?*const c_void) void;
pub extern fn ecs_get_system_context(world: ?*ecs_world_t, system_0: ecs_entity_t) ?*c_void;
pub extern fn _ecs_column(rows: [*c]ecs_rows_t, size: usize, column: u32) ?*c_void;
pub extern fn ecs_is_shared(rows: [*c]ecs_rows_t, column: u32) bool;
pub extern fn _ecs_field(rows: [*c]ecs_rows_t, size: usize, column: u32, row: u32) ?*c_void;
pub extern fn ecs_column_source(rows: [*c]ecs_rows_t, column: u32) ecs_entity_t;
pub extern fn ecs_column_entity(rows: [*c]ecs_rows_t, column: u32) ecs_entity_t;
pub extern fn ecs_column_type(rows: [*c]ecs_rows_t, column: u32) ecs_type_t;
pub extern fn ecs_table_type(rows: [*c]ecs_rows_t) ecs_type_t;
pub extern fn ecs_table_column(rows: [*c]ecs_rows_t, column: u32) ?*c_void;
pub extern fn ecs_new_entity(world: ?*ecs_world_t, id: [*c]const u8, components: [*c]const u8) ecs_entity_t;
pub extern fn ecs_new_component(world: ?*ecs_world_t, id: [*c]const u8, size: usize) ecs_entity_t;
pub extern fn ecs_new_system(world: ?*ecs_world_t, id: [*c]const u8, kind: EcsSystemKind, sig: [*c]const u8, action: ecs_system_action_t) ecs_entity_t;
pub extern fn ecs_new_type(world: ?*ecs_world_t, id: [*c]const u8, components: [*c]const u8) ecs_entity_t;
pub extern fn ecs_new_prefab(world: ?*ecs_world_t, id: [*c]const u8, sig: [*c]const u8) ecs_entity_t;
pub extern fn ecs_strerror(error_code: u32) [*c]const u8;
pub extern fn _ecs_abort(error_code: u32, param: [*c]const u8, file: [*c]const u8, line: u32) void;
pub extern fn _ecs_assert(condition: bool, error_code: u32, param: [*c]const u8, condition_str: [*c]const u8, file: [*c]const u8, line: u32) void;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const _IO_USER_LOCK = 32768;
pub const __INT64_FMTd__ = c"ld";
pub const __STDC_VERSION__ = c_long(201112);
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const __LZCNT__ = 1;
pub const ECS_INVALID_SIGNATURE = 6;
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __clang_version__ = c"9.0.0 (tags/RELEASE_900/final)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const __INTMAX_FMTd__ = c"ld";
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const ECS_INVALID_WHILE_ITERATING = 24;
pub const UINTMAX_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __FMA__ = 1;
pub const INT_LEAST64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const WINT_MIN = c_uint(0);
pub const __MMX__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const INTPTR_MAX = c_long(9223372036854775807);
pub const CLOCK_PROCESS_CPUTIME_ID = 2;
pub const _THREAD_SHARED_TYPES_H = 1;
pub const __RDSEED__ = 1;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const ECS_OUT_OF_RANGE = 27;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __ptr_t = [*c]void;
pub const __WCHAR_WIDTH__ = 32;
pub const TIMER_ABSTIME = 1;
pub const __FSGSBASE__ = 1;
pub const __USE_MISC = 1;
pub const __SIZEOF_PTHREAD_ATTR_T = 56;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const __FLT_EVAL_METHOD__ = 0;
pub const __SSE_MATH__ = 1;
pub const __UINT_FAST8_FMTo__ = c"hho";
pub const CLOCK_THREAD_CPUTIME_ID = 3;
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const __INT8_MAX__ = 127;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __PTHREAD_MUTEX_HAVE_PREV = 1;
pub const __SSSE3__ = 1;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const ECS_INVALID_ENTITY = 0;
pub const _SYS_CDEFS_H = 1;
pub const _ATFILE_SOURCE = 1;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __USE_POSIX199309 = 1;
pub const EEcsTypeComponent = 2;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const __pic__ = 2;
pub const __WCHAR_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-__WCHAR_MAX, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-__WCHAR_MAX, -1) else (-__WCHAR_MAX)(-1);
pub const ECS_COLUMN_IS_NOT_SHARED = 19;
pub const __INT_FAST16_FMTi__ = c"hi";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __LDBL_DENORM_MIN__ = -nan;
pub const ECS_COLUMN_IS_NOT_SET = 28;
pub const RAND_MAX = 2147483647;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub const _IOFBF = 0;
pub const __INT64_C_SUFFIX__ = L;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __struct_FILE_defined = 1;
pub const _IO_EOF_SEEN = 16;
pub const __USE_ATFILE = 1;
pub const __WALL = 1073741824;
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __DBL_DIG__ = 15;
pub const __ATOMIC_ACQUIRE = 2;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const _BITS_WCHAR_H = 1;
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub const ECS_3D = 3;
pub const __SEG_GS = 1;
pub const __UINT8_FMTo__ = c"hho";
pub const UINT_LEAST64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const __VERSION__ = c"Clang 9.0.0 (tags/RELEASE_900/final)";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const CLOCK_REALTIME = 0;
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const ECS_INVALID_TYPE_EXPRESSION = 5;
pub const __clockid_t_defined = 1;
pub const __UINT_LEAST8_MAX__ = 255;
pub const UINT8_MAX = 255;
pub const __RDRND__ = 1;
pub const __MOVBE__ = 1;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const __UINT16_MAX__ = 65535;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __x86_64 = 1;
pub const __PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;
pub const __SIZEOF_WINT_T__ = 4;
pub const ECS_ENTITY_MASK = if (@typeId(@typeOf(~ECS_ENTITY_FLAGS_MASK)) == @import("builtin").TypeId.Pointer) @ptrCast(ecs_entity_t, ~ECS_ENTITY_FLAGS_MASK) else if (@typeId(@typeOf(~ECS_ENTITY_FLAGS_MASK)) == @import("builtin").TypeId.Int) @intToPtr(ecs_entity_t, ~ECS_ENTITY_FLAGS_MASK) else ecs_entity_t(~ECS_ENTITY_FLAGS_MASK);
pub const __UINTMAX_FMTo__ = c"lo";
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub const __HAVE_FLOAT64X = 1;
pub const __WINT_UNSIGNED__ = 1;
pub const __HAVE_FLOAT16 = 0;
pub const ECS_UNKNOWN_TYPE_ID = 8;
pub const SIG_ATOMIC_MAX = 2147483647;
pub const ECS_UNRESOLVED_IDENTIFIER = 26;
pub const __F16C__ = 1;
pub const ECS_OUT_OF_MEMORY = 16;
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;
pub const __POINTER_WIDTH__ = 64;
pub const PTRDIFF_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub const __SIZEOF_LONG__ = 8;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __W_CONTINUED = 65535;
pub const @"false" = 0;
pub const __NO_INLINE__ = 1;
pub const __HAVE_FLOAT128 = 0;
pub const _TIME_H = 1;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const _BITS_PTHREADTYPES_COMMON_H = 1;
pub const __UINTMAX_FMTu__ = c"lu";
pub const INT_FAST8_MAX = 127;
pub const __FLT_RADIX__ = 2;
pub const __GLIBC_MINOR__ = 30;
pub const _STDINT_H = 1;
pub const _BITS_BYTESWAP_H = 1;
pub const _STRUCT_TIMESPEC = 1;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const FOPEN_MAX = 16;
pub const ECS_MODULE_UNDEFINED = 17;
pub const __UINTMAX_WIDTH__ = 64;
pub const __PTHREAD_MUTEX_USE_UNION = 0;
pub const __INT64_FMTi__ = c"li";
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const INT_LEAST16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-32767, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-32767, -1) else (-32767)(-1);
pub const __INT_FAST16_TYPE__ = short;
pub const __HAVE_DISTINCT_FLOAT128 = 0;
pub const ECS_MISSING_SYSTEM_CONTEXT = 10;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __LDBL_MIN__ = -nan;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __PIC__ = 2;
pub const _DEFAULT_SOURCE = 1;
pub const __FD_SETSIZE = 1024;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const __clang_minor__ = 0;
pub const INTMAX_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const __SIZEOF_FLOAT128__ = 16;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const INT_FAST16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __DBL_MAX__ = -nan;
pub const __UINT64_FMTx__ = c"lx";
pub const P_tmpdir = c"/tmp";
pub const CLOCK_TAI = 11;
pub const __WCOREFLAG = 128;
pub const SEEK_END = 2;
pub const __SLONG32_TYPE = int;
pub const _DEBUG = 1;
pub const INT32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __restrict_arr = __restrict;
pub const EEcsId = 8;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const __UINT8_FMTX__ = c"hhX";
pub const UINT_FAST8_MAX = 255;
pub const __UINTPTR_WIDTH__ = 64;
pub const __time_t_defined = 1;
pub const __WNOTHREAD = 536870912;
pub const ECS_INVALID_COMPONENT_SIZE = 15;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __AES__ = 1;
pub const __UINT8_FMTx__ = c"hhx";
pub const EEcsDisabled = 10;
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __INT16_FMTd__ = c"hd";
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const ECS_COLUMN_IS_SHARED = 20;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __INTMAX_WIDTH__ = 64;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const EXIT_FAILURE = 1;
pub const __USE_POSIX = 1;
pub const __SIZE_FMTo__ = c"lo";
pub const __PDP_ENDIAN = 3412;
pub const __INT_FAST8_FMTi__ = c"hhi";
pub const __UINT_LEAST32_FMTo__ = c"o";
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __FLT_MIN_EXP__ = -125;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const INT_LEAST8_MIN = -128;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GXX_ABI_VERSION = 1002;
pub const __MWAITX__ = 1;
pub const INTPTR_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const __FLT_MANT_DIG__ = 24;
pub const __UINT_FAST64_FMTx__ = c"lx";
pub const __STDC__ = 1;
pub const __HAVE_FLOAT64X_LONG_DOUBLE = 1;
pub const EEcsComponent = 1;
pub const EEcsPrefabBuilder = 5;
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const __SIZE_WIDTH__ = 64;
pub const __INT_LEAST64_FMTi__ = c"li";
pub const __HAVE_DISTINCT_FLOAT64 = 0;
pub const __SSE4_2__ = 1;
pub const __AVX__ = 1;
pub const __INT_FAST16_MAX__ = 32767;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __have_pthread_attr_t = 1;
pub const __INT_MAX__ = 2147483647;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __DBL_DENORM_MIN__ = -nan;
pub const __clang_major__ = 9;
pub const UINTPTR_MAX = c_ulong(18446744073709551615);
pub const __FLT_DENORM_MIN__ = -nan;
pub const __BIG_ENDIAN = 4321;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const SIG_ATOMIC_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __HAVE_DISTINCT_FLOAT32X = 0;
pub const __XSAVES__ = 1;
pub const __LDBL_HAS_DENORM__ = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const TMP_MAX = 238328;
pub const _ASSERT_H = 1;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __GLIBC_USE_LIB_EXT2 = 0;
pub const __SIZEOF_PTHREAD_MUTEX_T = 40;
pub const __UINT8_FMTu__ = c"hhu";
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __HAVE_FLOAT128X = 0;
pub const __SSE4A__ = 1;
pub const __SSE3__ = 1;
pub const __UINT16_FMTu__ = c"hu";
pub const __SIZE_FMTu__ = c"lu";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const SIZE_MAX = c_ulong(18446744073709551615);
pub const __SSP_STRONG__ = 2;
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __clang_patchlevel__ = 0;
pub const ECS_MORE_THAN_ONE_PREFAB = 13;
pub const EOF = -1;
pub const __PCLMUL__ = 1;
pub const __FXSR__ = 1;
pub const ECS_INVALID_EXPRESSION = 4;
pub const _IOLBF = 1;
pub const __UINT32_FMTx__ = c"x";
pub const EEcsColSystem = 7;
pub const __UINT32_FMTu__ = c"u";
pub const WNOHANG = 1;
pub const __SIZEOF_PTHREAD_COND_T = 48;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const _BITS_UINTN_IDENTITY_H = 1;
pub const __HAVE_DISTINCT_FLOAT32 = 0;
pub const __USE_ISOC11 = 1;
pub const ECS_SINGLETON = if (@typeId(@typeOf(if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(ECS_ENTITY_FLAGS_MASK, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(ECS_ENTITY_FLAGS_MASK, -1) else ECS_ENTITY_FLAGS_MASK(-1))) == @import("builtin").TypeId.Pointer) @ptrCast(ecs_entity_t, if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(ECS_ENTITY_FLAGS_MASK, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(ECS_ENTITY_FLAGS_MASK, -1) else ECS_ENTITY_FLAGS_MASK(-1)) else if (@typeId(@typeOf(if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(ECS_ENTITY_FLAGS_MASK, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(ECS_ENTITY_FLAGS_MASK, -1) else ECS_ENTITY_FLAGS_MASK(-1))) == @import("builtin").TypeId.Int) @intToPtr(ecs_entity_t, if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(ECS_ENTITY_FLAGS_MASK, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(ECS_ENTITY_FLAGS_MASK, -1) else ECS_ENTITY_FLAGS_MASK(-1)) else ecs_entity_t(if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(ECS_ENTITY_FLAGS_MASK, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(ECS_ENTITY_FLAGS_MASK, -1) else ECS_ENTITY_FLAGS_MASK(-1));
pub const UINT32_MAX = c_uint(4294967295);
pub const __x86_64__ = 1;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub const __UINTMAX_FMTx__ = c"lx";
pub const __UINT64_C_SUFFIX__ = UL;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __clock_t_defined = 1;
pub const __UINT32_FMTo__ = c"o";
pub const _SYS_SELECT_H = 1;
pub const _IONBF = 2;
pub const _SYS_TYPES_H = 1;
pub const UINT64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __INT_LEAST16_TYPE__ = short;
pub const ECS_2D = 2;
pub const __attribute_copy__ = arg;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const ECS_REFLECTION = 1;
pub const __SIZEOF_INT__ = 4;
pub const __USE_POSIX_IMPLICITLY = 1;
pub const INT8_MIN = -128;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const _IO_ERR_SEEN = 32;
pub const __amd64 = 1;
pub const _BITS_TIME64_H = 1;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const TIME_UTC = 1;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __SIZEOF_INT128__ = 16;
pub const __glibc_c99_flexarr_available = 1;
pub const __linux = 1;
pub const __sigset_t_defined = 1;
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = 4;
pub const WCHAR_MIN = __WCHAR_MIN;
pub const __clang__ = 1;
pub const INT_FAST16_MAX = c_long(9223372036854775807);
pub const _BITS_TIME_H = 1;
pub const __SSE4_1__ = 1;
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __UINT64_FMTo__ = c"lo";
pub const __INT_FAST32_FMTd__ = c"d";
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const CLOCK_MONOTONIC = 1;
pub const __ATOMIC_ACQ_REL = 4;
pub const ECS_THREAD_ERROR = 30;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const _ENDIAN_H = 1;
pub const ____mbstate_t_defined = 1;
pub const ECS_INVALID_COMPONENT_ID = 3;
pub const __GLIBC__ = 2;
pub const UINT_FAST64_MAX = if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Pointer) @ptrCast(__UINT64_C, 18446744073709551615) else if (@typeId(@typeOf(18446744073709551615)) == @import("builtin").TypeId.Int) @intToPtr(__UINT64_C, 18446744073709551615) else __UINT64_C(18446744073709551615);
pub const __WORDSIZE = 64;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub const _BITS_TYPES_LOCALE_T_H = 1;
pub const static_assert = _Static_assert;
pub const ECS_TYPE_TOO_LARGE = 32;
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __FLT_HAS_DENORM__ = 1;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const EEcsPrefabParent = 4;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __itimerspec_defined = 1;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __INT32_FMTi__ = c"i";
pub const __DBL_HAS_INFINITY__ = 1;
pub const __FINITE_MATH_ONLY__ = 0;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const _STDC_PREDEF_H = 1;
pub const __GNUC_VA_LIST = 1;
pub const EXIT_SUCCESS = 0;
pub const __SIZEOF_FLOAT__ = 4;
pub const INT_FAST64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const __INT_LEAST32_FMTi__ = c"i";
pub const __tune_znver1__ = 1;
pub const ECS_INVALID_PREFAB_CHILD_TYPE = 33;
pub const __LDBL_EPSILON__ = -nan;
pub const __INT_LEAST32_FMTd__ = c"d";
pub const __STDC_UTF_32__ = 1;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const CLOCK_REALTIME_COARSE = 5;
pub const __FD_ZERO_STOS = c"stosq";
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const __SEG_FS = 1;
pub const __GCC_ASM_FLAG_OUTPUTS__ = 1;
pub const __SIZEOF_DOUBLE__ = 8;
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const _STDLIB_H = 1;
pub const _BITS_STDIO_LIM_H = 1;
pub const __HAVE_FLOAT64 = 1;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const ECS_TYPE_NOT_AN_ENTITY = 9;
pub const __SIZE_FMTX__ = c"lX";
pub const ECS_COLUMN_INDEX_OUT_OF_RANGE = 18;
pub const __ID_T_TYPE = __U32_TYPE;
pub const CLOCK_BOOTTIME = 7;
pub const _BITS_TYPES_H = 1;
pub const ECS_INSTANCEOF = if (@typeId(@typeOf(1 << 63)) == @import("builtin").TypeId.Pointer) @ptrCast(ecs_entity_t, 1 << 63) else if (@typeId(@typeOf(1 << 63)) == @import("builtin").TypeId.Int) @intToPtr(ecs_entity_t, 1 << 63) else ecs_entity_t(1 << 63);
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __DBL_MIN_EXP__ = -1021;
pub const __HAVE_FLOAT32X = 1;
pub const __lldiv_t_defined = 1;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const _ALLOCA_H = 1;
pub const __znver1 = 1;
pub const __DBL_HAS_DENORM__ = 1;
pub const __FLOAT128__ = 1;
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __ATOMIC_RELAXED = 0;
pub const __XSAVEC__ = 1;
pub const __SIZEOF_SHORT__ = 2;
pub const ____FILE_defined = 1;
pub const __UINT_FAST16_MAX__ = 65535;
pub const __UINT16_FMTX__ = c"hX";
pub const ECS_UNSUPPORTED = 34;
pub const __timeval_defined = 1;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const WEXITED = 4;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const PTRDIFF_MAX = c_long(9223372036854775807);
pub const __AVX2__ = 1;
pub const __WINT_MAX__ = c_uint(4294967295);
pub const _STDIO_H = 1;
pub const __glibc_has_include = __has_include;
pub const __STDC_ISO_10646__ = c_long(201706);
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __STDC_HOSTED__ = 1;
pub const __INT_LEAST32_TYPE__ = int;
pub const __SCHAR_MAX__ = 127;
pub const __USE_POSIX2 = 1;
pub const __HAVE_FLOATN_NOT_TYPEDEF = 0;
pub const __TIMESIZE = __WORDSIZE;
pub const EEcsPrefab = 3;
pub const __USE_XOPEN2K = 1;
pub const __PRFCHW__ = 1;
pub const __USE_FORTIFY_LEVEL = 0;
pub const __ELF__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __PTHREAD_MUTEX_LOCK_ELISION = 1;
pub const __USE_XOPEN2K8 = 1;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const CLOCK_MONOTONIC_RAW = 4;
pub const INT16_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-32767, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-32767, -1) else (-32767)(-1);
pub const __UINT64_FMTX__ = c"lX";
pub const __DBL_MANT_DIG__ = 53;
pub const _____fpos_t_defined = 1;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __GLIBC_USE_DEPRECATED_SCANF = 0;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __USE_ISOC95 = 1;
pub const __UID_T_TYPE = __U32_TYPE;
pub const ECS_NOT_A_COMPONENT = 11;
pub const __LITTLE_ENDIAN__ = 1;
pub const __SSE__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const __HAVE_FLOAT32 = 1;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub const UINT16_MAX = 65535;
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __warnattr = msg;
pub const __STD_TYPE = typedef;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __LDBL_MAX__ = -nan;
pub const _LP64 = 1;
pub const FD_SETSIZE = __FD_SETSIZE;
pub const __code_model_small_ = 1;
pub const linux = 1;
pub const __FLT_DIG__ = 6;
pub const __INT16_MAX__ = 32767;
pub const __FLT_MAX_10_EXP__ = 38;
pub const _FEATURES_H = 1;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __WINT_WIDTH__ = 32;
pub const __SHRT_MAX__ = 32767;
pub const __znver1__ = 1;
pub const CLOCK_BOOTTIME_ALARM = 9;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const ECS_CHILDOF = if (@typeId(@typeOf(1 << 62)) == @import("builtin").TypeId.Pointer) @ptrCast(ecs_entity_t, 1 << 62) else if (@typeId(@typeOf(1 << 62)) == @import("builtin").TypeId.Int) @intToPtr(ecs_entity_t, 1 << 62) else ecs_entity_t(1 << 62);
pub const __INT32_FMTd__ = c"d";
pub const __DBL_MIN__ = -nan;
pub const __S32_TYPE = int;
pub const __INTPTR_WIDTH__ = 64;
pub const __INT_FAST32_TYPE__ = int;
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const ECS_UNKNOWN_COMPONENT_ID = 7;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const _POSIX_SOURCE = 1;
pub const __LITTLE_ENDIAN = 1234;
pub const __gnu_linux__ = 1;
pub const __BMI__ = 1;
pub const __FILE_defined = 1;
pub const _____fpos64_t_defined = 1;
pub const __timer_t_defined = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const INT_FAST8_MIN = -128;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __ASSERT_VOID_CAST = void;
pub const _BITS_STDINT_INTN_H = 1;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const SEEK_SET = 0;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __INT32_TYPE__ = int;
pub const __USE_POSIX199506 = 1;
pub const __FLT_MIN__ = -nan;
pub const __INT8_FMTd__ = c"hhd";
pub const EEcsRowSystem = 6;
pub const INT64_MAX = if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Pointer) @ptrCast(__INT64_C, 9223372036854775807) else if (@typeId(@typeOf(9223372036854775807)) == @import("builtin").TypeId.Int) @intToPtr(__INT64_C, 9223372036854775807) else __INT64_C(9223372036854775807);
pub const __FLT_MAX_EXP__ = 128;
pub const __XSAVE__ = 1;
pub const __INT_FAST64_FMTi__ = c"li";
pub const ECS_COLUMN_TYPE_MISMATCH = 22;
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const __LDBL_REDIR_DECL = name;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __SIZE_FMTx__ = c"lx";
pub const __DBL_EPSILON__ = -nan;
pub const ECS_INVALID_PARAMETER = 2;
pub const INT_FAST32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-c_long(9223372036854775807), -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-c_long(9223372036854775807), -1) else (-c_long(9223372036854775807))(-1);
pub const INT32_MAX = 2147483647;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __CHAR_BIT__ = 8;
pub const ECS_ALREADY_DEFINED = 14;
pub const __INT16_FMTi__ = c"hi";
pub const SEEK_CUR = 1;
pub const __GNUC_MINOR__ = 2;
pub const INT_LEAST32_MIN = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(-2147483647, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(-2147483647, -1) else (-2147483647)(-1);
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const ECS_UNRESOLVED_REFERENCE = 29;
pub const NFDBITS = __NFDBITS;
pub const __FLT_EPSILON__ = -nan;
pub const INT_FAST32_MAX = c_long(9223372036854775807);
pub const T0 = 0;
pub const __llvm__ = 1;
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub const __INT_FAST32_FMTi__ = c"i";
pub const CLOCKS_PER_SEC = if (@typeId(@typeOf(1000000)) == @import("builtin").TypeId.Pointer) @ptrCast(__clock_t, 1000000) else if (@typeId(@typeOf(1000000)) == @import("builtin").TypeId.Int) @intToPtr(__clock_t, 1000000) else __clock_t(1000000);
pub const ECS_MISSING_OS_API = 31;
pub const INT16_MAX = 32767;
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const NULL = if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Pointer) @ptrCast([*c]void, 0) else if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Int) @intToPtr([*c]void, 0) else ([*c]void)(0);
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __UINT32_FMTX__ = c"X";
pub const __PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;
pub const UINT_LEAST8_MAX = 255;
pub const ECS_INTERNAL_ERROR = 12;
pub const __UINT32_C_SUFFIX__ = U;
pub const __INT32_MAX__ = 2147483647;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __BIT_TYPES_DEFINED__ = 1;
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __STDC_UTF_16__ = 1;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const __ATOMIC_RELEASE = 3;
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __ldiv_t_defined = 1;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __SIZEOF_PTHREAD_BARRIER_T = 32;
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = 0;
pub const FILENAME_MAX = 4096;
pub const __INT16_TYPE__ = short;
pub const __SSE2_MATH__ = 1;
pub const UINT_LEAST16_MAX = 65535;
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = 0;
pub const UINT_LEAST32_MAX = c_uint(4294967295);
pub const __INT_FAST8_MAX__ = 127;
pub const __STDC_IEC_559__ = 1;
pub const __USE_ISOC99 = 1;
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const __UINT64_FMTu__ = c"lu";
pub const __struct_tm_defined = 1;
pub const __SSE2__ = 1;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __INTMAX_FMTi__ = c"li";
pub const __GNUC__ = 4;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub const ECS_INVALID_HANDLE = 1;
pub const _BITS_TYPES___LOCALE_T_H = 1;
pub const _POSIX_C_SOURCE = c_long(200809);
pub const __DBL_MAX_EXP__ = 1024;
pub const __INT8_FMTi__ = c"hhi";
pub const L_tmpnam = 20;
pub const ECS_COLUMN_HAS_NO_DATA = 21;
pub const WINT_MAX = c_uint(4294967295);
pub const UINT_FAST16_MAX = c_ulong(18446744073709551615);
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const __ATOMIC_SEQ_CST = 5;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __BMI2__ = 1;
pub const __HAVE_DISTINCT_FLOAT64X = 0;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __UINT8_MAX__ = 255;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const ECS_INVALID_WHILE_MERGING = 23;
pub const __UINT16_FMTo__ = c"ho";
pub const __POPCNT__ = 1;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __SIZEOF_PTHREAD_CONDATTR_T = 4;
pub const INT_LEAST8_MAX = 127;
pub const __SIZEOF_POINTER__ = 8;
pub const __TIMER_T_TYPE = [*c]void;
pub const __unix = 1;
pub const __GLIBC_USE_IEC_60559_BFP_EXT = 0;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const unix = 1;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const __FLT_MAX__ = -nan;
pub const BUFSIZ = 8192;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __ATOMIC_CONSUME = 1;
pub const __unix__ = 1;
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __GNU_LIBRARY__ = 6;
pub const __FLT_MIN_10_EXP__ = -37;
pub const __UINTPTR_FMTo__ = c"lo";
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const __UINTPTR_FMTx__ = c"lx";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const ECS_INVALID_FROM_WORKER = 25;
pub const EEcsHidden = 9;
pub const __attribute_alloc_size__ = params;
pub const __INT_LEAST8_MAX__ = 127;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __SHA__ = 1;
pub const INT8_MAX = 127;
pub const __ADX__ = 1;
pub const L_ctermid = 9;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const __CLZERO__ = 1;
pub const UINT_FAST32_MAX = c_ulong(18446744073709551615);
pub const __SIZEOF_PTHREAD_RWLOCK_T = 56;
pub const __UINT16_FMTx__ = c"hx";
pub const __UINTPTR_FMTu__ = c"lu";
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __CLFLUSHOPT__ = 1;
pub const __amd64__ = 1;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const __linux__ = 1;
pub const __LP64__ = 1;
pub const __SYSCALL_WORDSIZE = 64;
pub const __PTRDIFF_FMTi__ = c"li";
pub const _BITS_TYPESIZES_H = 1;
pub const WCONTINUED = 8;
pub const __XSAVEOPT__ = 1;
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const _BITS_PTHREADTYPES_ARCH_H = 1;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = 4;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const __INO_T_MATCHES_INO64_T = 1;
pub const INT_LEAST16_MAX = 32767;
pub const WUNTRACED = 2;
pub const INT_LEAST32_MAX = 2147483647;
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const __WCHAR_MAX__ = 2147483647;
pub const WSTOPPED = 2;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const _BITS_STDINT_UINTN_H = 1;
pub const WNOWAIT = 16777216;
pub const __UINTMAX_FMTX__ = c"lX";
pub const __WCLONE = 2147483648;
pub const CLOCK_MONOTONIC_COARSE = 6;
pub const CLOCK_REALTIME_ALARM = 8;
pub const tm = struct_tm;
pub const timespec = struct_timespec;
pub const itimerspec = struct_itimerspec;
pub const sigevent = struct_sigevent;
pub const __locale_data = struct___locale_data;
pub const __locale_struct = struct___locale_struct;
pub const timeval = struct_timeval;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const __va_list_tag = struct___va_list_tag;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const ecs_world = struct_ecs_world;
