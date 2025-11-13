#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Qt6::ProtobufQtGuiTypes" for configuration "Release"
set_property(TARGET Qt6::ProtobufQtGuiTypes APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Qt6::ProtobufQtGuiTypes PROPERTIES
  IMPORTED_IMPLIB_RELEASE "${_IMPORT_PREFIX}/lib/Qt6ProtobufQtGuiTypes.lib"
  IMPORTED_LINK_DEPENDENT_LIBRARIES_RELEASE "Qt6::Core;Qt6::Gui;Qt6::Protobuf"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/bin/Qt6ProtobufQtGuiTypes.dll"
  )

list(APPEND _cmake_import_check_targets Qt6::ProtobufQtGuiTypes )
list(APPEND _cmake_import_check_files_for_Qt6::ProtobufQtGuiTypes "${_IMPORT_PREFIX}/lib/Qt6ProtobufQtGuiTypes.lib" "${_IMPORT_PREFIX}/bin/Qt6ProtobufQtGuiTypes.dll" )

# Import target "Qt6::ProtobufQtGuiTypes_qtprotoreg" for configuration "Release"
set_property(TARGET Qt6::ProtobufQtGuiTypes_qtprotoreg APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Qt6::ProtobufQtGuiTypes_qtprotoreg PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_OBJECTS_RELEASE "${_IMPORT_PREFIX}/lib/objects-Release/ProtobufQtGuiTypes_qtprotoreg/QtGui/QtGui_qtprotoreg.cpp.obj"
  )

list(APPEND _cmake_import_check_targets Qt6::ProtobufQtGuiTypes_qtprotoreg )
list(APPEND _cmake_import_check_files_for_Qt6::ProtobufQtGuiTypes_qtprotoreg "${_IMPORT_PREFIX}/lib/objects-Release/ProtobufQtGuiTypes_qtprotoreg/QtGui/QtGui_qtprotoreg.cpp.obj" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
