#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "osgEarth::osgEarth" for configuration "Debug"
set_property(TARGET osgEarth::osgEarth APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(osgEarth::osgEarth PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/osgEarthd.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "protobuf::libprotobuf;spdlog::spdlog;GEOS::geos_c;blend2d::blend2d;meshoptimizer::meshoptimizer;CURL::libcurl_shared;GDAL::GDAL"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/osgEarthd.dll"
  )

list(APPEND _cmake_import_check_targets osgEarth::osgEarth )
list(APPEND _cmake_import_check_files_for_osgEarth::osgEarth "${_IMPORT_PREFIX}/debug/lib/osgEarthd.lib" "${_IMPORT_PREFIX}/debug/bin/osgEarthd.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
