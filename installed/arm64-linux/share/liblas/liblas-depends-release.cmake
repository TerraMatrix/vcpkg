#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "las" for configuration "Release"
set_property(TARGET las APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(las PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liblas.so.2.4.0"
  IMPORTED_SONAME_RELEASE "liblas.so.3"
  )

list(APPEND _cmake_import_check_targets las )
list(APPEND _cmake_import_check_files_for_las "${_IMPORT_PREFIX}/lib/liblas.so.2.4.0" )

# Import target "las_c" for configuration "Release"
set_property(TARGET las_c APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(las_c PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liblas_c.so.2.4.0"
  IMPORTED_SONAME_RELEASE "liblas_c.so.3"
  )

list(APPEND _cmake_import_check_targets las_c )
list(APPEND _cmake_import_check_files_for_las_c "${_IMPORT_PREFIX}/lib/liblas_c.so.2.4.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
