cmake_minimum_required(VERSION 3.25)

project(vertex
  VERSION 0.1.0
  DESCRIPTION "Market-data platform in modern C++20"
  LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

option(VERTEX_BUILD_TESTS "Build unit tests" ON)
option(VERTEX_IWYU "Run include-what-you-use during the build" OFF)

find_program(VERTEX_CCACHE ccache)
if(VERTEX_CCACHE)
  set(CMAKE_CXX_COMPILER_LAUNCHER "${VERTEX_CCACHE}")
endif()

include(Warnings)
include(Sanitizers)
include(Iwyu)
include(Dependencies)

if(VERTEX_BUILD_TESTS)
  enable_testing()
endif()

add_subdirectory(libs)
add_subdirectory(apps)
