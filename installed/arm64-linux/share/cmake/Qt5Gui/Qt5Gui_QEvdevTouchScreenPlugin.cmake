
add_library(Qt5::QEvdevTouchScreenPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/generic/libqevdevtouchplugin.so")
    _populate_Gui_plugin_properties(QEvdevTouchScreenPlugin RELEASE "generic/libqevdevtouchplugin.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/generic/libqevdevtouchplugin.so")
    _populate_Gui_plugin_properties(QEvdevTouchScreenPlugin DEBUG "generic/libqevdevtouchplugin.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEvdevTouchScreenPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_generic Qt5::QEvdevTouchScreenPlugin)
set_property(TARGET Qt5::QEvdevTouchScreenPlugin PROPERTY QT_PLUGIN_TYPE "generic")
set_property(TARGET Qt5::QEvdevTouchScreenPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QEvdevTouchScreenPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEvdevTouchScreenPlugin")
