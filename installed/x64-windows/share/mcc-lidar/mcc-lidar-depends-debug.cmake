#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "mcc-lidar" for configuration "Debug"
set_property(TARGET mcc-lidar APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(mcc-lidar PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/mcc-lidar.lib"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "Boost::filesystem;Boost::program_options;Boost::system;liblas"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/mcc-lidar.dll"
  )

list(APPEND _cmake_import_check_targets mcc-lidar )
list(APPEND _cmake_import_check_files_for_mcc-lidar "${_IMPORT_PREFIX}/debug/lib/mcc-lidar.lib" "${_IMPORT_PREFIX}/debug/bin/mcc-lidar.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
