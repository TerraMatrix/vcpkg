#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Boost::graph_parallel" for configuration "Debug"
set_property(TARGET Boost::graph_parallel APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Boost::graph_parallel PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/boost_graph_parallel-vc143-mt-gd-x64-1_86.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/boost_graph_parallel-vc143-mt-gd-x64-1_86.dll"
  )

list(APPEND _cmake_import_check_targets Boost::graph_parallel )
list(APPEND _cmake_import_check_files_for_Boost::graph_parallel "${_IMPORT_PREFIX}/debug/lib/boost_graph_parallel-vc143-mt-gd-x64-1_86.lib" "${_IMPORT_PREFIX}/debug/bin/boost_graph_parallel-vc143-mt-gd-x64-1_86.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
