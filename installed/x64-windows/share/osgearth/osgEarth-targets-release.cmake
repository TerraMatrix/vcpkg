#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "osgEarth::osgEarth" for configuration "Release"
set_property(TARGET osgEarth::osgEarth APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(osgEarth::osgEarth PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/osgEarth.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "protobuf::libprotobuf;spdlog::spdlog;GEOS::geos_c;blend2d::blend2d;meshoptimizer::meshoptimizer;CURL::libcurl_shared;GDAL::GDAL"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/osgEarth.dll"
  )

list(APPEND _cmake_import_check_targets osgEarth::osgEarth )
list(APPEND _cmake_import_check_files_for_osgEarth::osgEarth "${_IMPORT_PREFIX}/lib/osgEarth.lib" "${_IMPORT_PREFIX}/bin/osgEarth.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
