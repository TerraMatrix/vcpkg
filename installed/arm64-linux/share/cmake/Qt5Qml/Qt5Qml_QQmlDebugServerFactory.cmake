
add_library(Qt5::QQmlDebugServerFactory MODULE IMPORTED)


if(EXISTS "${_qt5Qml_install_prefix}/plugins/qmltooling/libqmldbg_server.so")
    _populate_Qml_plugin_properties(QQmlDebugServerFactory RELEASE "qmltooling/libqmldbg_server.so" FALSE)
endif()
if(EXISTS "${_qt5Qml_install_prefix}/debug/plugins/qmltooling/libqmldbg_server.so")
    _populate_Qml_plugin_properties(QQmlDebugServerFactory DEBUG "qmltooling/libqmldbg_server.so" FALSE)
endif()

list(APPEND Qt5Qml_PLUGINS Qt5::QQmlDebugServerFactory)
set_property(TARGET Qt5::Qml APPEND PROPERTY QT_ALL_PLUGINS_qmltooling Qt5::QQmlDebugServerFactory)
set_property(TARGET Qt5::QQmlDebugServerFactory PROPERTY QT_PLUGIN_TYPE "qmltooling")
set_property(TARGET Qt5::QQmlDebugServerFactory PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QQmlDebugServerFactory PROPERTY QT_PLUGIN_CLASS_NAME "QQmlDebugServerFactory")
