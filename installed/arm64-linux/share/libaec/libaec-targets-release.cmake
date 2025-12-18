#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libaec::aec" for configuration "Release"
set_property(TARGET libaec::aec APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libaec::aec PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libaec.so.0.1.3"
  IMPORTED_SONAME_RELEASE "libaec.so.0"
  )

list(APPEND _cmake_import_check_targets libaec::aec )
list(APPEND _cmake_import_check_files_for_libaec::aec "${_IMPORT_PREFIX}/lib/libaec.so.0.1.3" )

# Import target "libaec::sz" for configuration "Release"
set_property(TARGET libaec::sz APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libaec::sz PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libsz.so.2.0.1"
  IMPORTED_SONAME_RELEASE "libsz.so.2"
  )

list(APPEND _cmake_import_check_targets libaec::sz )
list(APPEND _cmake_import_check_files_for_libaec::sz "${_IMPORT_PREFIX}/lib/libsz.so.2.0.1" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
