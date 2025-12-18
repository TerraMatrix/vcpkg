
add_library(Qt5::QEglFSEmulatorIntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/egldeviceintegrations/libqeglfs-emu-integration.so")
    _populate_Gui_plugin_properties(QEglFSEmulatorIntegrationPlugin RELEASE "egldeviceintegrations/libqeglfs-emu-integration.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/egldeviceintegrations/libqeglfs-emu-integration.so")
    _populate_Gui_plugin_properties(QEglFSEmulatorIntegrationPlugin DEBUG "egldeviceintegrations/libqeglfs-emu-integration.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEglFSEmulatorIntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_egldeviceintegrations Qt5::QEglFSEmulatorIntegrationPlugin)
set_property(TARGET Qt5::QEglFSEmulatorIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "egldeviceintegrations")
set_property(TARGET Qt5::QEglFSEmulatorIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QEglFSEmulatorIntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEglFSEmulatorIntegrationPlugin")
