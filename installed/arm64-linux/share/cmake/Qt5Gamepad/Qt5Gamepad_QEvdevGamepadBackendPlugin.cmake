
add_library(Qt5::QEvdevGamepadBackendPlugin MODULE IMPORTED)


if(EXISTS "${_qt5Gamepad_install_prefix}/plugins/gamepads/libevdevgamepad.so")
    _populate_Gamepad_plugin_properties(QEvdevGamepadBackendPlugin RELEASE "gamepads/libevdevgamepad.so" FALSE)
endif()
if(EXISTS "${_qt5Gamepad_install_prefix}/debug/plugins/gamepads/libevdevgamepad.so")
    _populate_Gamepad_plugin_properties(QEvdevGamepadBackendPlugin DEBUG "gamepads/libevdevgamepad.so" FALSE)
endif()

list(APPEND Qt5Gamepad_PLUGINS Qt5::QEvdevGamepadBackendPlugin)
set_property(TARGET Qt5::Gamepad APPEND PROPERTY QT_ALL_PLUGINS_gamepads Qt5::QEvdevGamepadBackendPlugin)
set_property(TARGET Qt5::QEvdevGamepadBackendPlugin PROPERTY QT_PLUGIN_TYPE "gamepads")
set_property(TARGET Qt5::QEvdevGamepadBackendPlugin PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QEvdevGamepadBackendPlugin PROPERTY QT_PLUGIN_CLASS_NAME "QEvdevGamepadBackendPlugin")
