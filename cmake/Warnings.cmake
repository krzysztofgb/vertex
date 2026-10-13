add_library(vertex_warnings INTERFACE)
target_compile_options(vertex_warnings INTERFACE
  -Wall -Wextra -Wpedantic
  -Wconversion -Wsign-conversion -Wshadow
  -Werror)
