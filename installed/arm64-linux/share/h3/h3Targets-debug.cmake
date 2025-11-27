#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "h3::h3" for configuration "Debug"
set_property(TARGET h3::h3 APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(h3::h3 PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libh3.a"
  )

list(APPEND _cmake_import_check_targets h3::h3 )
list(APPEND _cmake_import_check_files_for_h3::h3 "${_IMPORT_PREFIX}/debug/lib/libh3.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
