#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Qt6::ProtobufQuick" for configuration "Release"
set_property(TARGET Qt6::ProtobufQuick APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Qt6::ProtobufQuick PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/Qt6ProtobufQuick.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "Qt6::Core;Qt6::Protobuf;Qt6::Qml"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/Qt6ProtobufQuick.dll"
  )

list(APPEND _cmake_import_check_targets Qt6::ProtobufQuick )
list(APPEND _cmake_import_check_files_for_Qt6::ProtobufQuick "${_IMPORT_PREFIX}/lib/Qt6ProtobufQuick.lib" "${_IMPORT_PREFIX}/bin/Qt6ProtobufQuick.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
