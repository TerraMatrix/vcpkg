#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "osgEarth::osgEarthImGui" for configuration "Debug"
set_property(TARGET osgEarth::osgEarthImGui APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(osgEarth::osgEarthImGui PROPERTIES
  IMPORTED_LINK_DEPENDENT_LIBRARIES_DEBUG "osgEarth::osgEarth"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libosgEarthImGui.so.3.7.2"
  IMPORTED_SONAME_DEBUG "libosgEarthImGui.so.171"
  )

list(APPEND _cmake_import_check_targets osgEarth::osgEarthImGui )
list(APPEND _cmake_import_check_files_for_osgEarth::osgEarthImGui "${_IMPORT_PREFIX}/debug/lib/libosgEarthImGui.so.3.7.2" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
