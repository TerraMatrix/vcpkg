get_filename_component(VCPKG_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)
#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "kmlbase" for configuration "Release"
set_property(TARGET kmlbase APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlbase PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libkmlbase.a"
  )

list(APPEND _cmake_import_check_targets kmlbase )
list(APPEND _cmake_import_check_files_for_kmlbase "${VCPKG_IMPORT_PREFIX}/lib/libkmlbase.a" )

# Import target "kmldom" for configuration "Release"
set_property(TARGET kmldom APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmldom PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libkmldom.a"
  )

list(APPEND _cmake_import_check_targets kmldom )
list(APPEND _cmake_import_check_files_for_kmldom "${VCPKG_IMPORT_PREFIX}/lib/libkmldom.a" )

# Import target "kmlxsd" for configuration "Release"
set_property(TARGET kmlxsd APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlxsd PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libkmlxsd.a"
  )

list(APPEND _cmake_import_check_targets kmlxsd )
list(APPEND _cmake_import_check_files_for_kmlxsd "${VCPKG_IMPORT_PREFIX}/lib/libkmlxsd.a" )

# Import target "kmlengine" for configuration "Release"
set_property(TARGET kmlengine APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlengine PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libkmlengine.a"
  )

list(APPEND _cmake_import_check_targets kmlengine )
list(APPEND _cmake_import_check_files_for_kmlengine "${VCPKG_IMPORT_PREFIX}/lib/libkmlengine.a" )

# Import target "kmlconvenience" for configuration "Release"
set_property(TARGET kmlconvenience APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlconvenience PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libkmlconvenience.a"
  )

list(APPEND _cmake_import_check_targets kmlconvenience )
list(APPEND _cmake_import_check_files_for_kmlconvenience "${VCPKG_IMPORT_PREFIX}/lib/libkmlconvenience.a" )

# Import target "kmlregionator" for configuration "Release"
set_property(TARGET kmlregionator APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(kmlregionator PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "${VCPKG_IMPORT_PREFIX}/lib/libkmlregionator.a"
  )

list(APPEND _cmake_import_check_targets kmlregionator )
list(APPEND _cmake_import_check_files_for_kmlregionator "${VCPKG_IMPORT_PREFIX}/lib/libkmlregionator.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
