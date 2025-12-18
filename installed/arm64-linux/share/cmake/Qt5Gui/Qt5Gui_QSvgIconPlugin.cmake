
add_library(Qt5::QSvgIconPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/iconengines/libqsvgicon.so")
    _populate_Gui_plugin_properties(QSvgIconPlugin RELEASE "iconengines/libqsvgicon.so" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/iconengines/libqsvgicon.so")
    _populate_Gui_plugin_properties(QSvgIconPlugin DEBUG "iconengines/libqsvgicon.so" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QSvgIconPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_iconengines Qt5::QSvgIconPlugin)
set_property(TARGET Qt5::QSvgIconPlugin PROPERTY QT_PLUGIN_TYPE "iconengines")
set_property(TARGET Qt5::QSvgIconPlugin PROPERTY QT_PLUGIN_EXTENDS "Qt::Gui")
set_property(TARGET Qt5::QSvgIconPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QSvgIconPlugin")
