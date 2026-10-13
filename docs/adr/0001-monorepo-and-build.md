# 0001: Monorepo and build

All code is in one repository with one CMake build. Applications are in `apps/`. Shared libraries are in `libs/`. The applications share much code. One build keeps the versions the same.

The CMake presets are the entry point: `debug`, `asan`, `tsan`, and `release`. The `asan` preset enables ASan and UBSan. All presets use Clang. A toolchain file selects the compiler, so the presets contain no paths. One compiler keeps the number of builds small. Clang shares its front end with clang-tidy and clangd. Compare GCC with Compiler Explorer when necessary.

Our targets link `vertex_warnings`. This makes all warnings errors. Third-party code does not use it. The sanitizers apply to all code, including the dependencies.

FetchContent downloads the dependencies at fixed tags. The repository does not contain copies of them.

The CI builds and tests the code on Linux x86 and macOS ARM. The CI does not measure performance.

On macOS 26, ASan programs hang at start when built with Apple Clang or Homebrew `llvm@21`. Homebrew `llvm` 23 works, so the toolchain file selects it. Check this again when the older versions are fixed.
