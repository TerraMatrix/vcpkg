#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "SuiteSparse::CCOLAMD_static" for configuration "Debug"
set_property(TARGET SuiteSparse::CCOLAMD_static APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(SuiteSparse::CCOLAMD_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_DEBUG "C"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/lib/libccolamd.a"
  )

list(APPEND _cmake_import_check_targets SuiteSparse::CCOLAMD_static )
list(APPEND _cmake_import_check_files_for_SuiteSparse::CCOLAMD_static "${_IMPORT_PREFIX}/debug/lib/libccolamd.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
