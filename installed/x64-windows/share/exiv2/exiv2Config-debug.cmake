#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "exiv2lib" for configuration "Debug"
set_property(TARGET exiv2lib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(exiv2lib PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/exiv2.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/exiv2.dll"
  )

list(APPEND _cmake_import_check_targets exiv2lib )
list(APPEND _cmake_import_check_files_for_exiv2lib "${_IMPORT_PREFIX}/debug/lib/exiv2.lib" "${_IMPORT_PREFIX}/debug/bin/exiv2.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
