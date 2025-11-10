#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "AOM::aom" for configuration "Release"
set_property(TARGET AOM::aom APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(AOM::aom PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/aom.lib"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/aom.dll"
  )

list(APPEND _cmake_import_check_targets AOM::aom )
list(APPEND _cmake_import_check_files_for_AOM::aom "${_IMPORT_PREFIX}/lib/aom.lib" "${_IMPORT_PREFIX}/bin/aom.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
