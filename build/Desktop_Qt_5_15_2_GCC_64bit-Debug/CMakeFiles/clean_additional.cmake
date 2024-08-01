# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "ADAVIA__IHM_autogen"
  "CMakeFiles/ADAVIA__IHM_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/ADAVIA__IHM_autogen.dir/ParseCache.txt"
  )
endif()
