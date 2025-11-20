#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "unofficial::poppler::poppler-cpp" for configuration "Debug"
set_property(TARGET unofficial::poppler::poppler-cpp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(unofficial::poppler::poppler-cpp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libpoppler-cpp.a"
  )

list(APPEND _cmake_import_check_targets unofficial::poppler::poppler-cpp )
list(APPEND _cmake_import_check_files_for_unofficial::poppler::poppler-cpp "${_IMPORT_PREFIX}/debug/lib/libpoppler-cpp.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
