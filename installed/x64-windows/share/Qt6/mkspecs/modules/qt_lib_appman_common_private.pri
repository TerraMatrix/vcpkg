QT.appman_common_private.VERSION = 6.9.1
QT.appman_common_private.name = QtAppManCommon
QT.appman_common_private.module = Qt6AppManCommon
QT.appman_common_private.libs = $$QT_MODULE_LIB_BASE
QT.appman_common_private.ldflags = 
QT.appman_common_private.includes = $$QT_MODULE_INCLUDE_BASE $$QT_MODULE_INCLUDE_BASE/QtAppManCommon $$QT_MODULE_INCLUDE_BASE/QtAppManCommon/6.9.1 $$QT_MODULE_INCLUDE_BASE/QtAppManCommon/6.9.1/QtAppManCommon
QT.appman_common_private.frameworks = 
QT.appman_common_private.bins = $$QT_MODULE_BIN_BASE
QT.appman_common_private.depends =  concurrent core network qml dbus
QT.appman_common_private.uses = 
QT.appman_common_private.module_config = v2 internal_module staticlib
QT.appman_common_private.DEFINES = QT_APPMAN_COMMON_LIB
QT.appman_common_private.enabled_features = am-installer am-widgets-support
QT.appman_common_private.disabled_features = am-multi-process
QT_CONFIG += am-installer am-widgets-support
QT_MODULES += appman_common_private

