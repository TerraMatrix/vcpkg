
add_library(Qt5::QtVirtualKeyboardHangulPlugin MODULE IMPORTED)


if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/plugins/virtualkeyboard/libqtvirtualkeyboard_hangul.so")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardHangulPlugin RELEASE "virtualkeyboard/libqtvirtualkeyboard_hangul.so" FALSE)
endif()
if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/debug/plugins/virtualkeyboard/libqtvirtualkeyboard_hangul.so")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardHangulPlugin DEBUG "virtualkeyboard/libqtvirtualkeyboard_hangul.so" FALSE)
endif()

list(APPEND Qt5VirtualKeyboard_PLUGINS Qt5::QtVirtualKeyboardHangulPlugin)
set_property(TARGET Qt5::VirtualKeyboard APPEND PROPERTY QT_ALL_PLUGINS_virtualkeyboard Qt5::QtVirtualKeyboardHangulPlugin)
set_property(TARGET Qt5::QtVirtualKeyboardHangulPlugin PROPERTY QT_PLUGIN_TYPE "virtualkeyboard")
set_property(TARGET Qt5::QtVirtualKeyboardHangulPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QtVirtualKeyboardHangulPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QtVirtualKeyboardHangulPlugin")
