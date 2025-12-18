#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Boost::python312" for configuration "Release"
set_property(TARGET Boost::python312 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Boost::python312 PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "Boost::graph"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libboost_python312.so.1.89.0"
  IMPORTED_SONAME_RELEASE "libboost_python312.so.1.89.0"
  )

list(APPEND _cmake_import_check_targets Boost::python312 )
list(APPEND _cmake_import_check_files_for_Boost::python312 "${_IMPORT_PREFIX}/lib/libboost_python312.so.1.89.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
