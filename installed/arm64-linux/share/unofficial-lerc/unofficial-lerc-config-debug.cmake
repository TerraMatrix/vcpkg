#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::Lerc::Lerc" for configuration "Debug"
set_property(TARGET unofficial::Lerc::Lerc APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::Lerc::Lerc PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libLerc.a"
  )

list(APPEND _cmake_import_check_targets unofficial::Lerc::Lerc )
list(APPEND _cmake_import_check_files_for_unofficial::Lerc::Lerc "${_IMPORT_PREFIX}/debug/lib/libLerc.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
