
add_library(Qt5::QPdfPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gui_install_prefix}/plugins/imageformats/qpdf.dll")
    _populate_Gui_plugin_properties(QPdfPlugin RELEASE "imageformats/qpdf.dll" FALSE)
endif()
if(EXISTS "${_qt5Gui_install_prefix}/debug/plugins/imageformats/qpdfd.dll")
    _populate_Gui_plugin_properties(QPdfPlugin DEBUG "imageformats/qpdfd.dll" FALSE)
endif()

list(APPEND Qt5Gui_PLUGINS Qt5::QPdfPlugin)
set_property(TARGET Qt5::Gui APPEND PROPERTY QT_ALL_PLUGINS_imageformats Qt5::QPdfPlugin)
set_property(TARGET Qt5::QPdfPlugin PROPERTY QT_PLUGIN_TYPE "imageformats")
set_property(TARGET Qt5::QPdfPlugin PROPERTY QT_PLUGIN_EXTENDS "Qt::Pdf")
set_property(TARGET Qt5::QPdfPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QPdfPlugin")
