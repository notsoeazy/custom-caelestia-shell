pragma ComponentBehavior: Bound

import qs.components
import qs.services
import qs.config
import QtQuick
import QtQuick.Layouts

StyledRect {
    id: root

    readonly property color colour: Colours.palette.m3primary
    readonly property int padding: Config.bar.clock.background ? Appearance.padding.normal : Appearance.padding.small

    // Format: [00:00 PM • Thu Jan 8]
    readonly property string timeStr: Time.format(Config.services.useTwelveHourClock ? "hh:mm A" : "HH:mm")
    readonly property string dateStr: Time.format("ddd MMM d")
    readonly property string fullText: `${timeStr} • ${dateStr}`

    implicitWidth: Config.bar.sizes.innerWidth
    // * 3 for extra padding on top and bottom
    implicitHeight: layout.implicitWidth + padding * 3 

    color: Config.bar.clock.background ? Colours.tPalette.m3surfaceContainer : "transparent"
    radius: Appearance.rounding.full

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: Appearance.spacing.smaller
        
        rotation: Config.bar.clock.inverted ? 270 : 90

        MaterialIcon {
            id: icon
            text: "schedule"
            color: root.colour
            visible: Config.bar.clock.showIcon
        }

        StyledText {
            id: clockText
            text: root.fullText
            font.pointSize: Appearance.font.size.smaller
            font.family: Appearance.font.family.mono
            color: root.colour
            wrapMode: Text.NoWrap
        }
    }
}
