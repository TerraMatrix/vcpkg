#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Verdict::verdict" for configuration "Debug"
set_property(TARGET Verdict::verdict APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Verdict::verdict PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libverdict.a"
  )

list(APPEND _cmake_import_check_targets Verdict::verdict )
list(APPEND _cmake_import_check_files_for_Verdict::verdict "${_IMPORT_PREFIX}/debug/lib/libverdict.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
