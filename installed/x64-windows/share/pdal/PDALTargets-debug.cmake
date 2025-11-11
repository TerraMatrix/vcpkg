#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "pdalcpp" for configuration "Debug"
set_property(TARGET pdalcpp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(pdalcpp PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/pdalcpp.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "GDAL::GDAL;PROJ::proj;geotiff_library;nlohmann_json_schema_validator::validator;LibXml2::LibXml2"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/pdalcpp.dll"
  )

list(APPEND _cmake_import_check_targets pdalcpp )
list(APPEND _cmake_import_check_files_for_pdalcpp "${_IMPORT_PREFIX}/debug/lib/pdalcpp.lib" "${_IMPORT_PREFIX}/debug/bin/pdalcpp.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
