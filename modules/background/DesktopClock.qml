import qs.components
import qs.services
import qs.config
import QtQuick

Item {
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

        anchors.top: timeText.bottom
        anchors.left: timeText.left
        anchors.topMargin: 10

        text: Time.format("dddd, MMMM d")  // Saturday, September 13

        font.pointSize: Appearance.font.size.extraLarge * 1.2
        font.letterSpacing: 2

        color: Colours.palette.m3secondary
    }
}
