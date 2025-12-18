
add_library(Qt5::OpenGLRendererPlugin MODULE IMPORTED)


if(EXISTS "${_qt53DRender_install_prefix}/plugins/renderers/libopenglrenderer.so")
    _populate_3DRender_plugin_properties(OpenGLRendererPlugin RELEASE "renderers/libopenglrenderer.so" FALSE)
endif()
if(EXISTS "${_qt53DRender_install_prefix}/debug/plugins/renderers/libopenglrenderer.so")
    _populate_3DRender_plugin_properties(OpenGLRendererPlugin DEBUG "renderers/libopenglrenderer.so" FALSE)
endif()

list(APPEND Qt53DRender_PLUGINS Qt5::OpenGLRendererPlugin)
set_property(TARGET Qt5::3DRender APPEND PROPERTY QT_ALL_PLUGINS_renderers Qt5::OpenGLRendererPlugin)
set_property(TARGET Qt5::OpenGLRendererPlugin PROPERTY QT_PLUGIN_TYPE "renderers")
set_property(TARGET Qt5::OpenGLRendererPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::OpenGLRendererPlugin PROPERTY QT_PLUGIN_CLASS_NAME "OpenGLRendererPlugin")
