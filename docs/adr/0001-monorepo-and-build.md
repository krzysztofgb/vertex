# 0001: Monorepo and build

All code is in one repository with one CMake build. Applications are in `apps/`. Shared libraries are in `libs/`. The applications share much code. One build keeps the versions the same.

The CMake presets are the entry point: `debug`, `asan`, and `release`. The `asan` preset enables ASan and UBSan. All presets use GCC. A toolchain file selects the compiler, so the presets contain no paths. GCC has the most complete C++26 support, including reflection. We use clang-format and clang-tidy as tools only.

There is no TSan preset. GCC has no TSan runtime on macOS. Add one when the code has threads, and run it on Linux.

Our targets link `vertex_warnings`. This makes all warnings errors. Third-party code does not use it. The sanitizers apply to all code, including the dependencies.

FetchContent downloads the dependencies at fixed tags. The repository does not contain copies of them.

The CI builds and tests the code on Linux x86 and macOS ARM. The CI does not measure performance.
