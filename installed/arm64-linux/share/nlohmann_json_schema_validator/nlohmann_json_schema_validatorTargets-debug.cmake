#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "nlohmann_json_schema_validator::validator" for configuration "Debug"
set_property(TARGET nlohmann_json_schema_validator::validator APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(nlohmann_json_schema_validator::validator PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libnlohmann_json_schema_validator.a"
  )

list(APPEND _cmake_import_check_targets nlohmann_json_schema_validator::validator )
list(APPEND _cmake_import_check_files_for_nlohmann_json_schema_validator::validator "${_IMPORT_PREFIX}/debug/lib/libnlohmann_json_schema_validator.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
