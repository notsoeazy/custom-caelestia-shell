import qs.components.effects
import qs.components
import qs.services
import qs.config
import qs.utils
import QtQuick

StyledRect {
    id: root
    
    color: Config.bar.osIcon.background ? Colours.tPalette.m3surfaceContainer : "transparent"
    radius: Appearance.rounding.full

    implicitWidth: implicitHeight
    implicitHeight: Config.bar.osIcon.background ? Config.bar.sizes.innerWidth : Appearance.font.size.large * 1.2

    StateLayer {
        // Cursed workaround to make the height larger than the parent
        anchors.fill: undefined
        anchors.centerIn: parent
        implicitWidth: implicitHeight
        implicitHeight: icon.implicitHeight + Appearance.padding.small * 2

        radius: Appearance.rounding.full

        function onClicked(): void {
            const visibilities = Visibilities.getForActive();
            visibilities.launcher = !visibilities.launcher;
        }
    }

    ColouredIcon {
        id:icon

        anchors.centerIn: parent
        source: SysInfo.osLogo
        implicitSize: Appearance.font.size.large * 1.2
        colour: Colours.palette.m3primary
    }
}
