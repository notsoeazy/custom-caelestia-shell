import qs.components
import qs.services
import qs.config
import QtQuick

Item {
    id: clockRoot

    // configurable position with defaults
    // property real posX: Config.background.desktopClock.x ?? 100
    // property real posY: Config.background.desktopClock.y ?? 100

    // configurable scale with default
    // property real scale: Config.background.desktopClock.scale ?? 1.0

    property real posX: 100
    property real posY: 100

    x: posX
    y: posY

    // mouse drag handler
    MouseArea {
        id: dragArea
        anchors.fill: parent
        drag.target: clockRoot
        cursorShape: Qt.OpenHandCursor
        
        onPressed: cursorShape = Qt.ClosedHandCursor
        onReleased: {
            cursorShape: Qt.OpenHandCursor

            // Save to config ...
        }
    }

    Column {
        spacing: 10

        StyledText {
            id: timeText
            text: Time.format(Config.services.useTwelveHourClock ? "hh:mm A" : "hh:mm")
            font.family: Appearance.font.family.clock
            font.weight: 600
            font.pointSize: Appearance.font.size.extraLarge * 3
            font.letterSpacing: 20
            color: Colours.palette.m3primary
        }

        StyledText {
            id: dateText
            text: Time.format("dddd, MMMM d") // Saturday, September 13
            font.pointSize: Appearance.font.size.extraLarge * 1.2
            font.letterSpacing: 2
            color: Colours.palette.m3secondary
        }
    }
}
