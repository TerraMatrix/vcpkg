
add_library(Qt5::QMinimalIntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platforms/libqminimal.so")
    _populate_Gui_plugin_properties(QMinimalIntegrationPlugin RELEASE "platforms/libqminimal.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platforms/libqminimal.so")
    _populate_Gui_plugin_properties(QMinimalIntegrationPlugin DEBUG "platforms/libqminimal.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QMinimalIntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platforms Qt5::QMinimalIntegrationPlugin)
set_property(TARGET Qt5::QMinimalIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "platforms")
set_property(TARGET Qt5::QMinimalIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QMinimalIntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QMinimalIntegrationPlugin")
