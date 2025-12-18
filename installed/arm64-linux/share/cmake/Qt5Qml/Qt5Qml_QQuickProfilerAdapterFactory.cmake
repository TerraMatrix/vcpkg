
add_library(Qt5::QQuickProfilerAdapterFactory MODULE IMPORTED)


if(EXISTS "${_qt5Qml_install_prefix}/plugins/qmltooling/libqmldbg_quickprofiler.so")
    _populate_Qml_plugin_properties(QQuickProfilerAdapterFactory RELEASE "qmltooling/libqmldbg_quickprofiler.so" FALSE)
endif()
if(EXISTS "${_qt5Qml_install_prefix}/debug/plugins/qmltooling/libqmldbg_quickprofiler.so")
    _populate_Qml_plugin_properties(QQuickProfilerAdapterFactory DEBUG "qmltooling/libqmldbg_quickprofiler.so" FALSE)
endif()

list(APPEND Qt5Qml_PLUGINS Qt5::QQuickProfilerAdapterFactory)
set_property(TARGET Qt5::Qml APPEND PROPERTY QT_ALL_PLUGINS_qmltooling Qt5::QQuickProfilerAdapterFactory)
set_property(TARGET Qt5::QQuickProfilerAdapterFactory PROPERTY QT_PLUGIN_TYPE "qmltooling")
set_property(TARGET Qt5::QQuickProfilerAdapterFactory PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QQuickProfilerAdapterFactory PROPERTY QT_PLUGIN_CLASS_NAME "QQuickProfilerAdapterFactory")
