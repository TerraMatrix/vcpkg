#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::poppler::poppler-cpp" for configuration "Release"
set_property(TARGET unofficial::poppler::poppler-cpp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(unofficial::poppler::poppler-cpp PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libpoppler-cpp.so.2.1.0"
  IMPORTED_SONAME_RELEASE "libpoppler-cpp.so.2"
  )

list(APPEND _cmake_import_check_targets unofficial::poppler::poppler-cpp )
list(APPEND _cmake_import_check_files_for_unofficial::poppler::poppler-cpp "${_IMPORT_PREFIX}/lib/libpoppler-cpp.so.2.1.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
