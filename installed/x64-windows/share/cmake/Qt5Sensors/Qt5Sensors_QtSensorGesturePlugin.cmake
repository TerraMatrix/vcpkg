
add_library(Qt5::QtSensorGesturePlugin MODULE IMPORTED)


if(EXISTS "${_qt5Sensors_install_prefix}/plugins/sensorgestures/qtsensorgestures_plugin.dll")
    _populate_Sensors_plugin_properties(QtSensorGesturePlugin RELEASE "sensorgestures/qtsensorgestures_plugin.dll" FALSE)
endif()
if(EXISTS "${_qt5Sensors_install_prefix}/debug/plugins/sensorgestures/qtsensorgestures_plugind.dll")
    _populate_Sensors_plugin_properties(QtSensorGesturePlugin DEBUG "sensorgestures/qtsensorgestures_plugind.dll" FALSE)
endif()

list(APPEND Qt5Sensors_PLUGINS Qt5::QtSensorGesturePlugin)
set_property(TARGET Qt5::Sensors APPEND PROPERTY QT_ALL_PLUGINS_sensorgestures Qt5::QtSensorGesturePlugin)
set_property(TARGET Qt5::QtSensorGesturePlugin PROPERTY QT_PLUGIN_TYPE "sensorgestures")
set_property(TARGET Qt5::QtSensorGesturePlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QtSensorGesturePlugin PROPERTY QT_PLUGIN_CLASS_NAME "QtSensorGesturePlugin")
