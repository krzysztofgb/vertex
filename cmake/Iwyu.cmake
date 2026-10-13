if(VERTEX_IWYU)
  find_program(VERTEX_IWYU_EXE NAMES include-what-you-use iwyu REQUIRED)
  set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE
    "${VERTEX_IWYU_EXE};-Xiwyu;--error")
endif()
