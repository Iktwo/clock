import QtQuick 2.2
import QtQuick.Controls 1.1


Item {
    property bool display: true

    Rectangle {
        anchors.fill: parent
        color: darkTheme ? "#000000" : "#ECF0F1"
    }

    Connections {
        target: appWindow
        onDarkThemeChanged: clock.requestPaint()
    }

    Label {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }

        color: darkTheme ? "#ECF0F1" : "#000000"
        text: qsTr("Analog")
        visible: display
    }

    AnalogClock {
        id: clock

        running: !display
        anchors.centerIn: parent
    }

    SettingsButton {
        anchors {
            right: parent.right; rightMargin: dpi * 0.04
            bottom: parent.bottom; bottomMargin: dpi * 0.04
        }
    }
}
