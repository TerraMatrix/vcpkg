
add_library(Qt5::QQmlNativeDebugConnectorFactory MODULE IMPORTED)


if(EXISTS "${_qt5Qml_install_prefix}/plugins/qmltooling/libqmldbg_native.so")
    _populate_Qml_plugin_properties(QQmlNativeDebugConnectorFactory RELEASE "qmltooling/libqmldbg_native.so" FALSE)
endif()
if(EXISTS "${_qt5Qml_install_prefix}/debug/plugins/qmltooling/libqmldbg_native.so")
    _populate_Qml_plugin_properties(QQmlNativeDebugConnectorFactory DEBUG "qmltooling/libqmldbg_native.so" FALSE)
endif()

list(APPEND Qt5Qml_PLUGINS Qt5::QQmlNativeDebugConnectorFactory)
set_property(TARGET Qt5::Qml APPEND PROPERTY QT_ALL_PLUGINS_qmltooling Qt5::QQmlNativeDebugConnectorFactory)
set_property(TARGET Qt5::QQmlNativeDebugConnectorFactory PROPERTY QT_PLUGIN_TYPE "qmltooling")
set_property(TARGET Qt5::QQmlNativeDebugConnectorFactory PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QQmlNativeDebugConnectorFactory PROPERTY QT_PLUGIN_CLASS_NAME "QQmlNativeDebugConnectorFactory")
