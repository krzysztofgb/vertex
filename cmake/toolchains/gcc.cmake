find_program(VERTEX_GXX
  NAMES g++-16 g++-15 g++-14 g++-13 g++
  HINTS /opt/homebrew/bin
  REQUIRED)
set(CMAKE_CXX_COMPILER "${VERTEX_GXX}" CACHE FILEPATH "" FORCE)
