
add_library(Qt5::QEglFSX11IntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/egldeviceintegrations/libqeglfs-x11-integration.so")
    _populate_Gui_plugin_properties(QEglFSX11IntegrationPlugin RELEASE "egldeviceintegrations/libqeglfs-x11-integration.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/egldeviceintegrations/libqeglfs-x11-integration.so")
    _populate_Gui_plugin_properties(QEglFSX11IntegrationPlugin DEBUG "egldeviceintegrations/libqeglfs-x11-integration.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEglFSX11IntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_egldeviceintegrations Qt5::QEglFSX11IntegrationPlugin)
set_property(TARGET Qt5::QEglFSX11IntegrationPlugin PROPERTY QT_PLUGIN_TYPE "egldeviceintegrations")
set_property(TARGET Qt5::QEglFSX11IntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QEglFSX11IntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEglFSX11IntegrationPlugin")
