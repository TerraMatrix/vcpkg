#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Boost::url" for configuration "Release"
set_property(TARGET Boost::url APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Boost::url PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_url.so.1.89.0"
  IMPORTED_SONAME_RELEASE "libboost_url.so.1.89.0"
  )

list(APPEND _cmake_import_check_targets Boost::url )
list(APPEND _cmake_import_check_files_for_Boost::url "${_IMPORT_PREFIX}/lib/libboost_url.so.1.89.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
