
add_library(Qt5::QtVirtualKeyboardOpenWnnPlugin MODULE IMPORTED)


if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/plugins/virtualkeyboard/qtvirtualkeyboard_openwnn.dll")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardOpenWnnPlugin RELEASE "virtualkeyboard/qtvirtualkeyboard_openwnn.dll" FALSE)
endif()
if(EXISTS "${_qt5VirtualKeyboard_install_prefix}/debug/plugins/virtualkeyboard/qtvirtualkeyboard_openwnnd.dll")
    _populate_VirtualKeyboard_plugin_properties(QtVirtualKeyboardOpenWnnPlugin DEBUG "virtualkeyboard/qtvirtualkeyboard_openwnnd.dll" FALSE)
endif()

list(APPEND Qt5VirtualKeyboard_PLUGINS Qt5::QtVirtualKeyboardOpenWnnPlugin)
set_property(TARGET Qt5::VirtualKeyboard APPEND PROPERTY QT_ALL_PLUGINS_virtualkeyboard Qt5::QtVirtualKeyboardOpenWnnPlugin)
set_property(TARGET Qt5::QtVirtualKeyboardOpenWnnPlugin PROPERTY QT_PLUGIN_TYPE "virtualkeyboard")
set_property(TARGET Qt5::QtVirtualKeyboardOpenWnnPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QtVirtualKeyboardOpenWnnPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QtVirtualKeyboardOpenWnnPlugin")
