#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "shapelib::shp" for configuration "Release"
set_property(TARGET shapelib::shp APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(shapelib::shp PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libshp.so.1.6.2"
  IMPORTED_SONAME_RELEASE "libshp.so.4"
  )

list(APPEND _cmake_import_check_targets shapelib::shp )
list(APPEND _cmake_import_check_files_for_shapelib::shp "${_IMPORT_PREFIX}/lib/libshp.so.1.6.2" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
