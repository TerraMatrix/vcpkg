#----------------------------------------------------------------
# Generated CMake target import file for libaec (SZIP support for HDF5)
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Get the import prefix
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# Import target "libaec::aec" for configuration "Release"
add_library(libaec::aec STATIC IMPORTED)
set_target_properties(libaec::aec PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libaec.a"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

list(APPEND _cmake_import_check_targets libaec::aec )
list(APPEND _cmake_import_check_files_for_libaec::aec "${_IMPORT_PREFIX}/lib/libaec.a" )

# Import target "libaec::aec_static" for configuration "Release"
add_library(libaec::aec_static STATIC IMPORTED)
set_target_properties(libaec::aec_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libaec.a"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

list(APPEND _cmake_import_check_targets libaec::aec_static )
list(APPEND _cmake_import_check_files_for_libaec::aec_static "${_IMPORT_PREFIX}/lib/libaec.a" )

# Import target "libaec::szlib" for configuration "Release"
# This provides compatibility with SZIP names
add_library(libaec::szlib STATIC IMPORTED)
set_target_properties(libaec::szlib PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libaec.a"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

list(APPEND _cmake_import_check_targets libaec::szlib )
list(APPEND _cmake_import_check_files_for_libaec::szlib "${_IMPORT_PREFIX}/lib/libaec.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)