
add_library(Qt5::QWebGLIntegrationPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/platforms/libqwebgl.so")
    _populate_Gui_plugin_properties(QWebGLIntegrationPlugin RELEASE "platforms/libqwebgl.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/platforms/libqwebgl.so")
    _populate_Gui_plugin_properties(QWebGLIntegrationPlugin DEBUG "platforms/libqwebgl.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QWebGLIntegrationPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_platforms Qt5::QWebGLIntegrationPlugin)
set_property(TARGET Qt5::QWebGLIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "platforms")
set_property(TARGET Qt5::QWebGLIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QWebGLIntegrationPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QWebGLIntegrationPlugin")
