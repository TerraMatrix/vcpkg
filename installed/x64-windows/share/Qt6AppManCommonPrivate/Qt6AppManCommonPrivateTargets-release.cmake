#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Qt6::AppManCommonPrivate" for configuration "Release"
set_property(TARGET Qt6::AppManCommonPrivate APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Qt6::AppManCommonPrivate PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/Qt6AppManCommon.lib"
  )

list(APPEND _cmake_import_check_targets Qt6::AppManCommonPrivate )
list(APPEND _cmake_import_check_files_for_Qt6::AppManCommonPrivate "${_IMPORT_PREFIX}/lib/Qt6AppManCommon.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
