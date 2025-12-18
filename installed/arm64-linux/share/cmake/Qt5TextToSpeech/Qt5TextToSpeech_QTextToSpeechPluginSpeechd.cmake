
add_library(Qt5::QTextToSpeechPluginSpeechd MODULE IMPORTED)


if(EXISTS "${_qt5TextToSpeech_install_prefix}/plugins/texttospeech/libqtexttospeech_speechd.so")
    _populate_TextToSpeech_plugin_properties(QTextToSpeechPluginSpeechd RELEASE "texttospeech/libqtexttospeech_speechd.so" FALSE)
endif()
if(EXISTS "${_qt5TextToSpeech_install_prefix}/debug/plugins/texttospeech/libqtexttospeech_speechd.so")
    _populate_TextToSpeech_plugin_properties(QTextToSpeechPluginSpeechd DEBUG "texttospeech/libqtexttospeech_speechd.so" FALSE)
endif()

list(APPEND Qt5TextToSpeech_PLUGINS Qt5::QTextToSpeechPluginSpeechd)
set_property(TARGET Qt5::TextToSpeech APPEND PROPERTY QT_ALL_PLUGINS_texttospeech Qt5::QTextToSpeechPluginSpeechd)
set_property(TARGET Qt5::QTextToSpeechPluginSpeechd PROPERTY QT_PLUGIN_TYPE "texttospeech")
set_property(TARGET Qt5::QTextToSpeechPluginSpeechd PROPERTY QT_PLUGIN_EXTENDS "")
set_property(TARGET Qt5::QTextToSpeechPluginSpeechd PROPERTY QT_PLUGIN_CLASS_NAME "QTextToSpeechPluginSpeechd")
