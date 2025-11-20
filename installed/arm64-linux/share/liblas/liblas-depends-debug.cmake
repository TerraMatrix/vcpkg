#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "las" for configuration "Debug"
set_property(TARGET las APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(las PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/liblas.so.2.4.0"
  IMPORTED_SONAME_DEBUG "liblas.so.3"
  )

list(APPEND _cmake_import_check_targets las )
list(APPEND _cmake_import_check_files_for_las "${_IMPORT_PREFIX}/debug/lib/liblas.so.2.4.0" )

# Import target "las_c" for configuration "Debug"
set_property(TARGET las_c APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(las_c PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/liblas_c.so.2.4.0"
  IMPORTED_SONAME_DEBUG "liblas_c.so.3"
  )

list(APPEND _cmake_import_check_targets las_c )
list(APPEND _cmake_import_check_files_for_las_c "${_IMPORT_PREFIX}/debug/lib/liblas_c.so.2.4.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
