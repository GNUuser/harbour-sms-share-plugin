!exists($$PWD/vcardserializer) {
    error("Please do git submodule update --init --recursive")
}

TEMPLATE = lib
TARGET = $$qtLibraryTarget(harboursmsshareplugin)
DEPENDPATH += .

CONFIG += plugin link_pkgconfig
CONFIG += sailfishapp_i18n_idbased
PKGCONFIG += nemotransferengine-qt5

QT += qml

NAME = harbour-sms-share-plugin
SMSSHARE_UI_DIR = /usr/share/$$NAME
SMSSHARE_TRANSLATIONS_DIR = $${SMSSHARE_UI_DIR}/translations

# Input
HEADERS += \
    src/smsplugininfo.h \
    src/smsshareplugin.h \
    src/smsuploader.h

SOURCES += \
    src/smsplugininfo.cpp \
    src/smsshareplugin.cpp \
    src/smsuploader.cpp
OTHER_FILES += \
    qml/SmsShare.qml \
    rpm/* \
    translations/*.ts

#TRANSLATIONS += translations/harbour_sms_share_plugin.ts \
TRANSLATIONS += translations/harbour_sms_share_plugin-hu.ts \
                translations/harbour_sms_share_plugin-pl.ts \
                translations/harbour_sms_share_plugin-sv.ts

shareui.files = qml/SmsShare.qml
shareui.path = $$SMSSHARE_UI_DIR
target.path = $$[QT_INSTALL_LIBS]/nemo-transferengine/plugins

translations.files = translations/*.qm
translations.path = $$[QT_INSTALL_DATA]/../translations/nemotransferengine

icon_.files = images/icon.svg
icon_.path = /usr/share/nemo-transferengine/plugins/harbour-sms-share-plugin

INSTALLS += target shareui translations icon_

DISTFILES += \
    rpm/harbour-sms-share-plugin.yaml

DISTFILES += $TRANSLATIONS

