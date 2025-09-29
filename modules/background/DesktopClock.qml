import qs.components
import qs.services
import qs.config
import QtQuick

Item {
<<<<<<< HEAD
    id: clockRoot

    // configurable position with defaults
    // property real posX: Config.background.desktopClock.x ?? 100
    // property real posY: Config.background.desktopClock.y ?? 100

    // font size multiplier (default 1.0)
    // property real fontScale: Config.background.desktopClock.fontScale ?? 1.0

    property real posX: 100
    property real posY: 100

    property real fontScale: 1.0

    x: posX
    y: posY

    width: timeDateContent.implicitWidth
    height: timeDateContent.implicitHeight

    // mouse drag handler
    MouseArea {
        id: dragArea
        anchors.fill: timeDateContent
        drag.target: clockRoot
        cursorShape: Qt.OpenHandCursor
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
=======
    StyledText {
        id: timeText
>>>>>>> main
        
        onPressed: cursorShape = Qt.ClosedHandCursor
        onReleased: {
            cursorShape: Qt.OpenHandCursor

            // TODO: Save clockRoot.x and clockRoot.y to Config.background.desktopClock
            // Example pseudo-call:
            // Config.set("background.desktopClock.x", clockRoot.x)
            // Config.set("background.desktopClock.y", clockRoot.y)
        }

        onWheel: {
           if (wheel.angleDelta.y > 0) {
                clockRoot.fontScale = Math.min(3.0, clockRoot.fontScale + 0.1) // grow
            } else {
                clockRoot.fontScale = Math.max(0.5, clockRoot.fontScale - 0.1) // shrink
            }
            // TODO: Save new scale
            // Config.set("background.desktopClock.scale", clockRoot.scale)
        }

    }

    Column {
        id: timeDateContent
        spacing: 10

        StyledText {
            id: timeText
            text: Time.format(Config.services.useTwelveHourClock ? "hh:mmA" : "hh:mm")
            font.family: Appearance.font.family.clock
            font.weight: 600
            font.pointSize: Appearance.font.size.extraLarge * 3 * clockRoot.fontScale
            font.letterSpacing: 20 * clockRoot.fontScale
            color: Colours.palette.m3primary
        }

        StyledText {
            id: dateText
            text: Time.format("dddd, MMMM d")
            font.pointSize: Appearance.font.size.extraLarge * 1.2 * clockRoot.fontScale
            font.letterSpacing: 2 * clockRoot.fontScale
            color: Colours.palette.m3secondary
        }
    }
}
