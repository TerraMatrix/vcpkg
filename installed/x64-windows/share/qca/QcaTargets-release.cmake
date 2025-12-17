get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "qca" for configuration "Release"
set_property(TARGET qca APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(qca PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/qca.lib"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/bin/qca.dll"
  )

list(APPEND _cmake_import_check_targets qca )
list(APPEND _cmake_import_check_files_for_qca "${VCPKG_IMPORT_PREFIX}/lib/qca.lib" "${VCPKG_IMPORT_PREFIX}/bin/qca.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
