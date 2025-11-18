#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Boost::cobalt" for configuration "Debug"
set_property(TARGET Boost::cobalt APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Boost::cobalt PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libboost_cobalt.a"
  )

list(APPEND _cmake_import_check_targets Boost::cobalt )
list(APPEND _cmake_import_check_files_for_Boost::cobalt "${_IMPORT_PREFIX}/debug/lib/libboost_cobalt.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
