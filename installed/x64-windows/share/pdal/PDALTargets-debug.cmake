#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "pdal_util" for configuration "Debug"
set_property(TARGET pdal_util APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(pdal_util PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/pdal_util.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/pdal_util.dll"
  )

list(APPEND _cmake_import_check_targets pdal_util )
list(APPEND _cmake_import_check_files_for_pdal_util "${_IMPORT_PREFIX}/debug/lib/pdal_util.lib" "${_IMPORT_PREFIX}/debug/bin/pdal_util.dll" )

# Import target "pdalcpp" for configuration "Debug"
set_property(TARGET pdalcpp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(pdalcpp PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/pdalcpp.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "GDAL::GDAL;geotiff_library;pdal_util"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/pdalcpp.dll"
  )

list(APPEND _cmake_import_check_targets pdalcpp )
list(APPEND _cmake_import_check_files_for_pdalcpp "${_IMPORT_PREFIX}/debug/lib/pdalcpp.lib" "${_IMPORT_PREFIX}/debug/bin/pdalcpp.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
