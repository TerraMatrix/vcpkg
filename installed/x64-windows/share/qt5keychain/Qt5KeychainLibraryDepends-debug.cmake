#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "qt5keychain" for configuration "Debug"
set_property(TARGET qt5keychain APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(qt5keychain PROPERTIES
  IMPORTED_IMPLIB_DEBUG "${_IMPORT_PREFIX}/debug/lib/qt5keychaind.lib"
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/debug/bin/qt5keychaind.dll"
  )

list(APPEND _cmake_import_check_targets qt5keychain )
list(APPEND _cmake_import_check_files_for_qt5keychain "${_IMPORT_PREFIX}/debug/lib/qt5keychaind.lib" "${_IMPORT_PREFIX}/debug/bin/qt5keychaind.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
