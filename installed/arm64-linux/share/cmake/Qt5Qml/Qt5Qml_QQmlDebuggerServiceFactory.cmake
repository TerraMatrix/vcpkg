
add_library(Qt5::QQmlDebuggerServiceFactory MODULE IMPORTED)


if(EXISTS "${_qt5Qml_install_prefix}/plugins/qmltooling/libqmldbg_debugger.so")
    _populate_Qml_plugin_properties(QQmlDebuggerServiceFactory RELEASE "qmltooling/libqmldbg_debugger.so" FALSE)
endif()
if(EXISTS "${_qt5Qml_install_prefix}/debug/plugins/qmltooling/libqmldbg_debugger.so")
    _populate_Qml_plugin_properties(QQmlDebuggerServiceFactory DEBUG "qmltooling/libqmldbg_debugger.so" FALSE)
endif()

list(APPEND Qt5Qml_PLUGINS Qt5::QQmlDebuggerServiceFactory)
set_property(TARGET Qt5::Qml APPEND PROPERTY QT_ALL_PLUGINS_qmltooling Qt5::QQmlDebuggerServiceFactory)
set_property(TARGET Qt5::QQmlDebuggerServiceFactory PROPERTY QT_PLUGIN_TYPE "qmltooling")
set_property(TARGET Qt5::QQmlDebuggerServiceFactory PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QQmlDebuggerServiceFactory PROPERTY QT_PLUGIN_CLASS_NAME "QQmlDebuggerServiceFactory")
