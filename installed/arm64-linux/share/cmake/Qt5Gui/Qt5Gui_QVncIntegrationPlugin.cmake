
add_library(Qt5::QVncIntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platforms/libqvnc.so")
    _populate_Gui_plugin_properties(QVncIntegrationPlugin RELEASE "platforms/libqvnc.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platforms/libqvnc.so")
    _populate_Gui_plugin_properties(QVncIntegrationPlugin DEBUG "platforms/libqvnc.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QVncIntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platforms Qt5::QVncIntegrationPlugin)
set_property(TARGET Qt5::QVncIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "platforms")
set_property(TARGET Qt5::QVncIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QVncIntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QVncIntegrationPlugin")
