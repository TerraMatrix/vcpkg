get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "qca" for configuration "Debug"
set_property(TARGET qca APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(qca PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${VCPKG_IMPORT_PREFIX}/debug/lib/qcad.lib"
  IMPORTED_LOCATION_DEBUG "${VCPKG_IMPORT_PREFIX}/debug/bin/qcad.dll"
  )

list(APPEND _cmake_import_check_targets qca )
list(APPEND _cmake_import_check_files_for_qca "${VCPKG_IMPORT_PREFIX}/debug/lib/qcad.lib" "${VCPKG_IMPORT_PREFIX}/debug/bin/qcad.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
