#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "basisu::basisu_encoder" for configuration "Release"
set_property(TARGET basisu::basisu_encoder APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(basisu::basisu_encoder PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/basisu_encoder.lib"
  )

list(APPEND _cmake_import_check_targets basisu::basisu_encoder )
list(APPEND _cmake_import_check_files_for_basisu::basisu_encoder "${_IMPORT_PREFIX}/lib/basisu_encoder.lib" )

# Import target "basisu::basisu" for configuration "Release"
set_property(TARGET basisu::basisu APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(basisu::basisu PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/tools/basisu/basisu.exe"
  )

list(APPEND _cmake_import_check_targets basisu::basisu )
list(APPEND _cmake_import_check_files_for_basisu::basisu "${_IMPORT_PREFIX}/tools/basisu/basisu.exe" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
