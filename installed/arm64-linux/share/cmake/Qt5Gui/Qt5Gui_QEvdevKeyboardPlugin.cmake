
add_library(Qt5::QEvdevKeyboardPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/generic/libqevdevkeyboardplugin.so")
    _populate_Gui_plugin_properties(QEvdevKeyboardPlugin RELEASE "generic/libqevdevkeyboardplugin.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/generic/libqevdevkeyboardplugin.so")
    _populate_Gui_plugin_properties(QEvdevKeyboardPlugin DEBUG "generic/libqevdevkeyboardplugin.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEvdevKeyboardPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_generic Qt5::QEvdevKeyboardPlugin)
set_property(TARGET Qt5::QEvdevKeyboardPlugin PROPERTY QT_PLUGIN_TYPE "generic")
set_property(TARGET Qt5::QEvdevKeyboardPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QEvdevKeyboardPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEvdevKeyboardPlugin")
