import QtQuick 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    id: appWindow

    /// TODO: saveLastTheme and lastView
    property bool darkTheme: true
    property int dpi: Screen.pixelDensity * 25.4
    function getBestIconSize(height) {
        // 36,  48,  72,  96, 144, 192
        // 42,  60,  84, 120, 168
        if (height < 42)
            return "ldpi/"
        else if (height < 60)
            return "mdpi/"
        else if (height < 84)
            return "hdpi/"
        else if (height < 120)
            return "xhdpi/"
        else if (height < 168)
            return "xxhdpi/"
        else if (height < 216)
            return "xxxhdpi/"
        else
            return ""
    }

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
