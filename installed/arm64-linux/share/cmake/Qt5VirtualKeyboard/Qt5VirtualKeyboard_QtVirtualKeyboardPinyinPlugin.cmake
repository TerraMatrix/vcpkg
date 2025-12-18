
add_library(Qt5::QtVirtualKeyboardPinyinPlugin MODULE IMPORTED)


if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/plugins/virtualkeyboard/libqtvirtualkeyboard_pinyin.so")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardPinyinPlugin RELEASE "virtualkeyboard/libqtvirtualkeyboard_pinyin.so" FALSE)
endif()
if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/debug/plugins/virtualkeyboard/libqtvirtualkeyboard_pinyin.so")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardPinyinPlugin DEBUG "virtualkeyboard/libqtvirtualkeyboard_pinyin.so" FALSE)
endif()

list(APPEND Qt5VirtualKeyboard_PLUGINS Qt5::QtVirtualKeyboardPinyinPlugin)
set_property(TARGET Qt5::VirtualKeyboard APPEND PROPERTY QT_ALL_PLUGINS_virtualkeyboard Qt5::QtVirtualKeyboardPinyinPlugin)
set_property(TARGET Qt5::QtVirtualKeyboardPinyinPlugin PROPERTY QT_PLUGIN_TYPE "virtualkeyboard")
set_property(TARGET Qt5::QtVirtualKeyboardPinyinPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QtVirtualKeyboardPinyinPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QtVirtualKeyboardPinyinPlugin")
