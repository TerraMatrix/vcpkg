
add_library(Qt5::QtVirtualKeyboardPinyinPlugin MODULE IMPORTED)


if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/plugins/virtualkeyboard/qtvirtualkeyboard_pinyin.dll")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardPinyinPlugin RELEASE "virtualkeyboard/qtvirtualkeyboard_pinyin.dll" FALSE)
endif()
if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/debug/plugins/virtualkeyboard/qtvirtualkeyboard_pinyind.dll")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardPinyinPlugin DEBUG "virtualkeyboard/qtvirtualkeyboard_pinyind.dll" FALSE)
endif()

list(APPEND Qt5VirtualKeyboard_PLUGINS Qt5::QtVirtualKeyboardPinyinPlugin)
set_property(TARGET Qt5::VirtualKeyboard APPEND PROPERTY QT_ALL_PLUGINS_virtualkeyboard Qt5::QtVirtualKeyboardPinyinPlugin)
set_property(TARGET Qt5::QtVirtualKeyboardPinyinPlugin PROPERTY QT_PLUGIN_TYPE "virtualkeyboard")
set_property(TARGET Qt5::QtVirtualKeyboardPinyinPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QtVirtualKeyboardPinyinPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QtVirtualKeyboardPinyinPlugin")
