#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "basisu::basisu_encoder" for configuration "Debug"
set_property(TARGET basisu::basisu_encoder APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(basisu::basisu_encoder PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C;CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/basisu_encoder.lib"
  )

list(APPEND _cmake_import_check_targets basisu::basisu_encoder )
list(APPEND _cmake_import_check_files_for_basisu::basisu_encoder "${_IMPORT_PREFIX}/debug/lib/basisu_encoder.lib" )

# Import target "basisu::basisu" for configuration "Debug"
set_property(TARGET basisu::basisu APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(basisu::basisu PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/tools/basisu/basisu.exe"
  )

list(APPEND _cmake_import_check_targets basisu::basisu )
list(APPEND _cmake_import_check_files_for_basisu::basisu "${_IMPORT_PREFIX}/tools/basisu/basisu.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
