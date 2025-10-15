
add_library(Qt5::QShakeSensorGesturePlugin MODULE IMPORTED)


if(EXISTS "${_qt5Sensors_install_prefix}/plugins/sensorgestures/qtsensorgestures_shakeplugin.dll")
    _populate_Sensors_plugin_properties(QShakeSensorGesturePlugin RELEASE "sensorgestures/qtsensorgestures_shakeplugin.dll" FALSE)
endif()
if(EXISTS "${_qt5Sensors_install_prefix}/debug/plugins/sensorgestures/qtsensorgestures_shakeplugind.dll")
    _populate_Sensors_plugin_properties(QShakeSensorGesturePlugin DEBUG "sensorgestures/qtsensorgestures_shakeplugind.dll" FALSE)
endif()

list(APPEND Qt5Sensors_PLUGINS Qt5::QShakeSensorGesturePlugin)
set_property(TARGET Qt5::Sensors APPEND PROPERTY QT_ALL_PLUGINS_sensorgestures Qt5::QShakeSensorGesturePlugin)
set_property(TARGET Qt5::QShakeSensorGesturePlugin PROPERTY QT_PLUGIN_TYPE "sensorgestures")
set_property(TARGET Qt5::QShakeSensorGesturePlugin PROPERTY QT_PLUGIN_EXTENDS "-")
set_property(TARGET Qt5::QShakeSensorGesturePlugin PROPERTY QT_PLUGIN_CLASS_NAME "QShakeSensorGesturePlugin")
