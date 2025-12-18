
add_library(Qt5::QEvdevTabletPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/generic/libqevdevtabletplugin.so")
    _populate_Gui_plugin_properties(QEvdevTabletPlugin RELEASE "generic/libqevdevtabletplugin.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/generic/libqevdevtabletplugin.so")
    _populate_Gui_plugin_properties(QEvdevTabletPlugin DEBUG "generic/libqevdevtabletplugin.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEvdevTabletPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_generic Qt5::QEvdevTabletPlugin)
set_property(TARGET Qt5::QEvdevTabletPlugin PROPERTY QT_PLUGIN_TYPE "generic")
set_property(TARGET Qt5::QEvdevTabletPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QEvdevTabletPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEvdevTabletPlugin")
