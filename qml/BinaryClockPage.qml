import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    property bool display: true

    Rectangle {
        anchors.fill: parent

        color: darkTheme ? "#000000" : "#ECF0F1"
    }

    Label {
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }

        color: darkTheme ? "#ECF0F1" : "#000000"
        text: qsTr("BCD")
        visible: display
    }

    BinaryClock {
        anchors.centerIn: parent
        running: !display
    }

    Image {
        anchors {
            right: parent.right; rightMargin: 10
            bottom: parent.bottom; bottomMargin: 10
        }

        height: parent.height / 8
        width: parent.width / 8
        fillMode: Image.PreserveAspectFit
        smooth: true
        antialiasing: true
        visible: !display

        source: darkTheme ? "qrc:/images/settings_dark" : "qrc:/images/settings"

        MouseArea {
            anchors.fill: parent
            enabled: parent.visible

            onClicked: stackView.push(settingsPage)
        }
    }
}
