import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    id: appWindow

    /// TODO: saveLastTheme and lastView
    property bool darkTheme: true

    width: 801
    height: 800

    StackView {
        id: stackView

        anchors.fill: parent

        initialItem: analogClock
    }

    AnalogClockPage {
        id: analogClock

        display: false
    }

    SettingsPage {
        id: settingsPage

        clip: true
    }

    BinaryClockPage {
        id: binaryClock

        display: false
    }
}
