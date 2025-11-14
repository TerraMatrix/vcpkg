#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Halide::Halide" for configuration "Debug"
set_property(TARGET Halide::Halide APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(Halide::Halide PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/Halide.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/Halide.dll"
  )

list(APPEND _cmake_import_check_targets Halide::Halide )
list(APPEND _cmake_import_check_files_for_Halide::Halide "${_IMPORT_PREFIX}/debug/lib/Halide.lib" "${_IMPORT_PREFIX}/debug/bin/Halide.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
