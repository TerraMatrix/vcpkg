#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Qt6::AppManMonitorPrivate" for configuration "Debug"
set_property(TARGET Qt6::AppManMonitorPrivate APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Qt6::AppManMonitorPrivate PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/Qt6AppManMonitord.lib"
  )

list(APPEND _cmake_import_check_targets Qt6::AppManMonitorPrivate )
list(APPEND _cmake_import_check_files_for_Qt6::AppManMonitorPrivate "${_IMPORT_PREFIX}/debug/lib/Qt6AppManMonitord.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
