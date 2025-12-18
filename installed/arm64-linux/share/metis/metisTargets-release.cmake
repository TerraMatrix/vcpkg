#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "metis" for configuration "Release"
set_property(TARGET metis APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(metis PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "GKlib::GKlib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libmetis.so"
  IMPORTED_SONAME_RELEASE "libmetis.so"
  )

list(APPEND _cmake_import_check_targets metis )
list(APPEND _cmake_import_check_files_for_metis "${_IMPORT_PREFIX}/lib/libmetis.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
