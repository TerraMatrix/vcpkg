
add_library(Qt5::QEglFSIntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platforms/libqeglfs.so")
    _populate_Gui_plugin_properties(QEglFSIntegrationPlugin RELEASE "platforms/libqeglfs.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platforms/libqeglfs.so")
    _populate_Gui_plugin_properties(QEglFSIntegrationPlugin DEBUG "platforms/libqeglfs.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QEglFSIntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platforms Qt5::QEglFSIntegrationPlugin)
set_property(TARGET Qt5::QEglFSIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "platforms")
set_property(TARGET Qt5::QEglFSIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QEglFSIntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEglFSIntegrationPlugin")
