import qs.components
import qs.services
import qs.config
import Quickshell
import QtQuick

StyledRect {
    id: root

    required property PersistentProperties visibilities

    color: Config.bar.power.background ? Colours.tPalette.m3surfaceContainer : "transparent"
    radius: Appearance.rounding.full

    implicitWidth: implicitHeight
    implicitHeight: Config.bar.power.background ? Config.bar.sizes.innerWidth : icon.implicitHeight

    StateLayer {
        // Cursed workaround to make the height larger than the parent
        anchors.fill: undefined
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: Config.bar.power.background ? 1 : 0
        implicitWidth: implicitHeight
        implicitHeight: icon.implicitHeight + Appearance.padding.small * 2

        radius: Appearance.rounding.full

        function onClicked(): void {
            root.visibilities.session = !root.visibilities.session;
        }
    }

    MaterialIcon {
        id: icon

        anchors.centerIn: parent
        anchors.horizontalCenterOffset: Config.bar.power.background ? 0 : -1

        text: "power_settings_new"
        color: Colours.palette.m3error
        font.bold: true
        font.pointSize: Appearance.font.size.normal
    }
}
