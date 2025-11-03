#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "LASlib" for configuration "Debug"
set_property(TARGET LASlib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(LASlib PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/LASlib.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/LASlib.dll"
  )

list(APPEND _cmake_import_check_targets LASlib )
list(APPEND _cmake_import_check_files_for_LASlib "${_IMPORT_PREFIX}/debug/lib/LASlib.lib" "${_IMPORT_PREFIX}/debug/bin/LASlib.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
