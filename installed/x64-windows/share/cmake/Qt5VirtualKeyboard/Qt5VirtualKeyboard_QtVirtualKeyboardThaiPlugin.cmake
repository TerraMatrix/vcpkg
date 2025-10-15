
add_library(Qt5::QtVirtualKeyboardThaiPlugin MODULE IMPORTED)


if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/plugins/virtualkeyboard/qtvirtualkeyboard_thai.dll")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardThaiPlugin RELEASE "virtualkeyboard/qtvirtualkeyboard_thai.dll" FALSE)
endif()
if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/debug/plugins/virtualkeyboard/qtvirtualkeyboard_thaid.dll")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardThaiPlugin DEBUG "virtualkeyboard/qtvirtualkeyboard_thaid.dll" FALSE)
endif()

list(APPEND Qt5VirtualKeyboard_PLUGINS Qt5::QtVirtualKeyboardThaiPlugin)
set_property(TARGET Qt5::VirtualKeyboard APPEND PROPERTY QT_ALL_PLUGINS_virtualkeyboard Qt5::QtVirtualKeyboardThaiPlugin)
set_property(TARGET Qt5::QtVirtualKeyboardThaiPlugin PROPERTY QT_PLUGIN_TYPE "virtualkeyboard")
set_property(TARGET Qt5::QtVirtualKeyboardThaiPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QtVirtualKeyboardThaiPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QtVirtualKeyboardThaiPlugin")
