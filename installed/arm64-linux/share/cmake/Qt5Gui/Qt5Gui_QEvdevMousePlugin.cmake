
add_library(Qt5::QEvdevMousePlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/generic/libqevdevmouseplugin.so")
    _populate_Gui_plugin_properties(QEvdevMousePlugin RELEASE "generic/libqevdevmouseplugin.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/generic/libqevdevmouseplugin.so")
    _populate_Gui_plugin_properties(QEvdevMousePlugin DEBUG "generic/libqevdevmouseplugin.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEvdevMousePlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_generic Qt5::QEvdevMousePlugin)
set_property(TARGET Qt5::QEvdevMousePlugin PROPERTY QT_PLUGIN_TYPE "generic")
set_property(TARGET Qt5::QEvdevMousePlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QEvdevMousePlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEvdevMousePlugin")
