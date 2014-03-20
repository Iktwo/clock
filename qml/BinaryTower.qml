import QtQuick 2.2
import QtQuick.Layouts 1.1

Item {
    id: root

    property int value: 3
    property string _values: decToBin(value)
    property int elements: 4

    property color activeColor: "#f26522"
    property color inactiveColor: "#eaeaea"

    function decToBin(value) {
        var r = parseInt(value, 10).toString(2)
        for (var i = r.length; i < elements; ++i)
            r = "0" + r;

        return r;
    }

    height: 100
    width: height / 4

    Column {
        anchors.bottom: parent.bottom

        Repeater {
            model: elements

            Item {
                width: root.width
                height: width

                Rectangle {
                    anchors.centerIn: parent

                    width: parent.width * 0.90
                    height: width

                    radius: width * 0.5
                    color: _values[index] == 1 ? activeColor : inactiveColor
                }
            }
        }
    }
}
