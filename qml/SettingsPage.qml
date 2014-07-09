import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import "style.js" as Style

Rectangle {
    property var date: new Date()

    color: darkTheme ? "#000000" : "#ECF0F1"

    Column {
        id: container

        property int targetHeight: parent.height / 6

        width: parent.width / 2
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            id: label
            color: darkTheme ? Style.LIGHT_TEXT : Style.DARK_TEXT
            text: qsTr("Dark theme")
            font.pixelSize: container.targetHeight / 6
            fontSizeMode: Text.Fit
            height: container.targetHeight / 6
            width: parent.width
            horizontalAlignment: "AlignHCenter"
        }

        TextSwitch {
            id: txt
            active: clock.darkTheme
            pixelSize: height
            height: (container.targetHeight / 6) * 5
            width: parent.width

            onActiveChanged: clock.darkTheme = active
        }
    }

    ListView {
        id: view

        anchors {
            top: container.bottom
            left: parent.left
            right: parent.right
            bottom: backButton.top
        }

        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem

        model: ListModel {
            ListElement {
                name: "BCD"
                element: "BinaryClockPage.qml"
            }

            ListElement {
                name: "Analog"
                element: "AnalogClockPage.qml"
            }
        }

        delegate: Loader {
            height: view.height
            width: view.width
            source: element

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    stackView.pop({immediate: true})

                    if (name == "BCD")
                        stackView.replace({item: binaryClock, immediate: true})
                    else if (name == "Analog")
                        stackView.replace({item: analogClock, immediate: true})

                    clock.watchFace = name
                }
            }
        }
    }

    Button {
        id: backButton

        anchors {
            left: parent.left; leftMargin: 10
            bottom: parent.bottom; bottomMargin: 10
        }

        text: "Back"
        onClicked: stackView.pop()
    }
}
