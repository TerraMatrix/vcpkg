
add_library(Qt5::QTextToSpeechPluginSapi MODULE IMPORTED)


if(EXISTS "${_qt5TextToSpeech_install_prefix}/plugins/texttospeech/qtexttospeech_sapi.dll")
    _populate_TextToSpeech_plugin_properties(QTextToSpeechPluginSapi RELEASE "texttospeech/qtexttospeech_sapi.dll" FALSE)
endif()
if(EXISTS "${_qt5TextToSpeech_install_prefix}/debug/plugins/texttospeech/qtexttospeech_sapid.dll")
    _populate_TextToSpeech_plugin_properties(QTextToSpeechPluginSapi DEBUG "texttospeech/qtexttospeech_sapid.dll" FALSE)
endif()

list(APPEND Qt5TextToSpeech_PLUGINS Qt5::QTextToSpeechPluginSapi)
set_property(TARGET Qt5::TextToSpeech APPEND PROPERTY QT_ALL_PLUGINS_texttospeech Qt5::QTextToSpeechPluginSapi)
set_property(TARGET Qt5::QTextToSpeechPluginSapi PROPERTY QT_PLUGIN_TYPE "texttospeech")
set_property(TARGET Qt5::QTextToSpeechPluginSapi PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QTextToSpeechPluginSapi PROPERTY QT_PLUGIN_CLASS_NAME "QTextToSpeechPluginSapi")
