#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Qhull::qhullcpp" for configuration "Debug"
set_property(TARGET Qhull::qhullcpp APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Qhull::qhullcpp PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "CXX"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libqhullcpp_d.a"
  )

list(APPEND _cmake_import_check_targets Qhull::qhullcpp )
list(APPEND _cmake_import_check_files_for_Qhull::qhullcpp "${_IMPORT_PREFIX}/debug/lib/libqhullcpp_d.a" )

# Import target "Qhull::qhullstatic" for configuration "Debug"
set_property(TARGET Qhull::qhullstatic APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Qhull::qhullstatic PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "m"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libqhullstatic_d.a"
  )

list(APPEND _cmake_import_check_targets Qhull::qhullstatic )
list(APPEND _cmake_import_check_files_for_Qhull::qhullstatic "${_IMPORT_PREFIX}/debug/lib/libqhullstatic_d.a" )

# Import target "Qhull::qhullstatic_r" for configuration "Debug"
set_property(TARGET Qhull::qhullstatic_r APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Qhull::qhullstatic_r PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LINK_INTERFACE_LIBRARIES_DEBUG "m"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libqhullstatic_rd.a"
  )

list(APPEND _cmake_import_check_targets Qhull::qhullstatic_r )
list(APPEND _cmake_import_check_files_for_Qhull::qhullstatic_r "${_IMPORT_PREFIX}/debug/lib/libqhullstatic_rd.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
