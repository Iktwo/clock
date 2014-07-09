QT += quick widgets svg

SOURCES += \
    src/main.cpp \
    src/translator.cpp \
    src/clock.cpp

RESOURCES += \
    resources.qrc

HEADERS += \
    src/translator.h \
    src/clock.h

OTHER_FILES += \
    qml/*.qml \
    qml/*.js \
    android/AndroidManifest.xml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
