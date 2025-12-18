#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "flann::flann_cpp" for configuration "Release"
set_property(TARGET flann::flann_cpp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(flann::flann_cpp PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libflann_cpp.so.1.9.2"
  IMPORTED_SONAME_RELEASE "libflann_cpp.so.1.9"
  )

list(APPEND _cmake_import_check_targets flann::flann_cpp )
list(APPEND _cmake_import_check_files_for_flann::flann_cpp "${_IMPORT_PREFIX}/lib/libflann_cpp.so.1.9.2" )

# Import target "flann::flann" for configuration "Release"
set_property(TARGET flann::flann APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(flann::flann PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libflann.so.1.9.2"
  IMPORTED_SONAME_RELEASE "libflann.so.1.9"
  )

list(APPEND _cmake_import_check_targets flann::flann )
list(APPEND _cmake_import_check_files_for_flann::flann "${_IMPORT_PREFIX}/lib/libflann.so.1.9.2" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
