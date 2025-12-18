
add_library(Qt5::LinuxSensorPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Sensors_install_prefix}/plugins/sensors/libqtsensors_linuxsys.so")
    _populate_Sensors_plugin_properties(LinuxSensorPlugin RELEASE "sensors/libqtsensors_linuxsys.so" FALSE)
endif()
if(EXISTS "${_qt5Sensors_install_prefix}/debug/plugins/sensors/libqtsensors_linuxsys.so")
    _populate_Sensors_plugin_properties(LinuxSensorPlugin DEBUG "sensors/libqtsensors_linuxsys.so" FALSE)
endif()

list(APPEND Qt5Sensors_PLUGINS Qt5::LinuxSensorPlugin)
set_property(TARGET Qt5::Sensors APPEND PROPERTY QT_ALL_PLUGINS_sensors Qt5::LinuxSensorPlugin)
set_property(TARGET Qt5::LinuxSensorPlugin PROPERTY QT_PLUGIN_TYPE "sensors")
set_property(TARGET Qt5::LinuxSensorPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::LinuxSensorPlugin PROPERTY QT_PLUGIN_CLASS_NAME "LinuxSensorPlugin")
