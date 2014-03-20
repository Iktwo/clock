QT += quick widgets svg

SOURCES += \
    src/main.cpp \
    src/translator.cpp

RESOURCES += \
    resources.qrc

HEADERS += \
    src/translator.h

OTHER_FILES += \
    qml/main.qml \
    qml/AnalogClock.qml \
    android/AndroidManifest.xml \
    qml/AnalogClockPage.qml \
    qml/SettingsPage.qml \
    qml/BinaryClock.qml \
    qml/BinaryClockPage.qml \
    qml/BinaryTower.qml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
