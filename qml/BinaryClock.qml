import QtQuick 2.2

Item {
    id: root

    property int h1: 1
    property int h2: 3

    property alias running: timer.running
    property color activeColor: darkTheme ? "#e74c3c" : "#e67e22"
    property color inactiveColor:  darkTheme ? "#34495e" : "#bdc3c7"

    property int circleSize: height / 4
    property var date: new Date()

    width: parent.width <= parent.height ? parent.width : (parent.height * 0.67) * 1.5
    height: parent.width <= parent.height ? parent.width * 0.67 : parent.height * 0.67

    BinaryTower {
        id: tH1

        activeColor: root.activeColor
        inactiveColor: root.inactiveColor
        height: parent.height
        elements: 2
        value: Qt.formatDateTime(date,"hhmmss").charAt(0)
    }

    BinaryTower {
        id: tH2

        anchors.left: tH1.right

        activeColor: root.activeColor
        inactiveColor: root.inactiveColor
        height: parent.height
        value: Qt.formatDateTime(date,"hhmmss").charAt(1)
    }

    BinaryTower {
        id: tM1

        anchors.left: tH2.right

        activeColor: root.activeColor
        inactiveColor: root.inactiveColor
        height: parent.height
        elements: 3
        value: Qt.formatDateTime(date,"hhmmss").charAt(2)
    }

    BinaryTower {
        id: tM2

        anchors.left: tM1.right

        activeColor: root.activeColor
        inactiveColor: root.inactiveColor
        height: parent.height
        value: Qt.formatDateTime(date,"hhmmss").charAt(3)
    }

    BinaryTower {
        id: tS1

        anchors.left: tM2.right

        activeColor: root.activeColor
        inactiveColor: root.inactiveColor
        height: parent.height
        elements: 3
        value: Qt.formatDateTime(date,"hhmmss").charAt(4)
    }

    BinaryTower {
        id: tS2

        anchors.left: tS1.right

        activeColor: root.activeColor
        inactiveColor: root.inactiveColor
        height: parent.height
        value: Qt.formatDateTime(date,"hhmmss").charAt(5)
    }

    Timer {
        id:timer
        repeat: true
        interval: 1000
        running: true
        onTriggered: date = new Date()
    }
}
