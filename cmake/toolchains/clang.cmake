# Use the newest Homebrew LLVM first. ASan hangs at start with Apple Clang and llvm@21 on macOS 26.
find_program(VERTEX_CLANGXX
  NAMES clang++-23 clang++-22 clang++-21 clang++-20 clang++-19 clang++-18 clang++
  HINTS /opt/homebrew/opt/llvm/bin /usr/lib/llvm-21/bin /usr/lib/llvm-18/bin
  REQUIRED)
set(CMAKE_CXX_COMPILER "${VERTEX_CLANGXX}" CACHE FILEPATH "" FORCE)
