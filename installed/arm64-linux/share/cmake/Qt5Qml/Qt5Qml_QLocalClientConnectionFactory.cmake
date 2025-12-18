
add_library(Qt5::QLocalClientConnectionFactory MODULE IMPORTED)


if(EXISTS "${_qt5Qml_install_prefix}/plugins/qmltooling/libqmldbg_local.so")
    _populate_Qml_plugin_properties(QLocalClientConnectionFactory RELEASE "qmltooling/libqmldbg_local.so" FALSE)
endif()
if(EXISTS "${_qt5Qml_install_prefix}/debug/plugins/qmltooling/libqmldbg_local.so")
    _populate_Qml_plugin_properties(QLocalClientConnectionFactory DEBUG "qmltooling/libqmldbg_local.so" FALSE)
endif()

list(APPEND Qt5Qml_PLUGINS Qt5::QLocalClientConnectionFactory)
set_property(TARGET Qt5::Qml APPEND PROPERTY QT_ALL_PLUGINS_qmltooling Qt5::QLocalClientConnectionFactory)
set_property(TARGET Qt5::QLocalClientConnectionFactory PROPERTY QT_PLUGIN_TYPE "qmltooling")
set_property(TARGET Qt5::QLocalClientConnectionFactory PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QLocalClientConnectionFactory PROPERTY QT_PLUGIN_CLASS_NAME "QLocalClientConnectionFactory")
