#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "spatialindex" for configuration "Debug"
set_property(TARGET spatialindex APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(spatialindex PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libspatialindexd.so.8.0.0"
  IMPORTED_SONAME_DEBUG "libspatialindexd.so.8"
  )

list(APPEND _cmake_import_check_targets spatialindex )
list(APPEND _cmake_import_check_files_for_spatialindex "${_IMPORT_PREFIX}/debug/lib/libspatialindexd.so.8.0.0" )

# Import target "spatialindex_c" for configuration "Debug"
set_property(TARGET spatialindex_c APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(spatialindex_c PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libspatialindex_cd.so.8.0.0"
  IMPORTED_SONAME_DEBUG "libspatialindex_cd.so.8"
  )

list(APPEND _cmake_import_check_targets spatialindex_c )
list(APPEND _cmake_import_check_files_for_spatialindex_c "${_IMPORT_PREFIX}/debug/lib/libspatialindex_cd.so.8.0.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
