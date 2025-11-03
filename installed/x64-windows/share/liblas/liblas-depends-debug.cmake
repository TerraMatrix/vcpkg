#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "liblas" for configuration "Debug"
set_property(TARGET liblas APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(liblas PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/liblas.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/liblas.dll"
  )

list(APPEND _cmake_import_check_targets liblas )
list(APPEND _cmake_import_check_files_for_liblas "${_IMPORT_PREFIX}/debug/lib/liblas.lib" "${_IMPORT_PREFIX}/debug/bin/liblas.dll" )

# Import target "liblas_c" for configuration "Debug"
set_property(TARGET liblas_c APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(liblas_c PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/liblas_c.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/liblas_c.dll"
  )

list(APPEND _cmake_import_check_targets liblas_c )
list(APPEND _cmake_import_check_files_for_liblas_c "${_IMPORT_PREFIX}/debug/lib/liblas_c.lib" "${_IMPORT_PREFIX}/debug/bin/liblas_c.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
