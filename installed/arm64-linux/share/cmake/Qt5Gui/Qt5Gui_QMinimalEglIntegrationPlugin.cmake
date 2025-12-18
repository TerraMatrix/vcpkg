
add_library(Qt5::QMinimalEglIntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platforms/libqminimalegl.so")
    _populate_Gui_plugin_properties(QMinimalEglIntegrationPlugin RELEASE "platforms/libqminimalegl.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platforms/libqminimalegl.so")
    _populate_Gui_plugin_properties(QMinimalEglIntegrationPlugin DEBUG "platforms/libqminimalegl.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QMinimalEglIntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platforms Qt5::QMinimalEglIntegrationPlugin)
set_property(TARGET Qt5::QMinimalEglIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "platforms")
set_property(TARGET Qt5::QMinimalEglIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QMinimalEglIntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QMinimalEglIntegrationPlugin")
