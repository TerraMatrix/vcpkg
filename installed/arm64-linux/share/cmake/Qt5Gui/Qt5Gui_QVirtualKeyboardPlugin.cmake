
add_library(Qt5::QVirtualKeyboardPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so")
    _populate_Gui_plugin_properties(QVirtualKeyboardPlugin RELEASE "platforminputcontexts/libqtvirtualkeyboardplugin.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so")
    _populate_Gui_plugin_properties(QVirtualKeyboardPlugin DEBUG "platforminputcontexts/libqtvirtualkeyboardplugin.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QVirtualKeyboardPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platforminputcontexts Qt5::QVirtualKeyboardPlugin)
set_property(TARGET Qt5::QVirtualKeyboardPlugin PROPERTY QT_PLUGIN_TYPE "platforminputcontexts")
set_property(TARGET Qt5::QVirtualKeyboardPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QVirtualKeyboardPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QVirtualKeyboardPlugin")
