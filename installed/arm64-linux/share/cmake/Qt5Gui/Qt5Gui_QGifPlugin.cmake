
add_library(Qt5::QGifPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/imageformats/libqgif.so")
    _populate_Gui_plugin_properties(QGifPlugin RELEASE "imageformats/libqgif.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/imageformats/libqgif.so")
    _populate_Gui_plugin_properties(QGifPlugin DEBUG "imageformats/libqgif.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QGifPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_imageformats Qt5::QGifPlugin)
set_property(TARGET Qt5::QGifPlugin PROPERTY QT_PLUGIN_TYPE "imageformats")
set_property(TARGET Qt5::QGifPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QGifPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QGifPlugin")
