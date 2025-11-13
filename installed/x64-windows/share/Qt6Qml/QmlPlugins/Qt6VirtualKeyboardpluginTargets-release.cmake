#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Qt6::VirtualKeyboardplugin" for configuration "Release"
set_property(TARGET Qt6::VirtualKeyboardplugin APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Qt6::VirtualKeyboardplugin PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_RELEASE ""
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/Qt6/qml/QtQuick/VirtualKeyboard/Core/virtualkeyboardplugin.dll"
  )

list(APPEND _cmake_import_check_targets Qt6::VirtualKeyboardplugin )
list(APPEND _cmake_import_check_files_for_Qt6::VirtualKeyboardplugin "${_IMPORT_PREFIX}/Qt6/qml/QtQuick/VirtualKeyboard/Core/virtualkeyboardplugin.dll" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
