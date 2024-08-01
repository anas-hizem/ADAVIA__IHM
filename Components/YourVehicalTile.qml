import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../controls"

Rectangle {
    id: root
    signal componentSelected(int index)
    property bool celsius : true
    color: "#151515"
    Layout.preferredWidth: 270
    Layout.preferredHeight: 560
    radius: 15

    ColumnLayout {
        width: parent.width * 0.8
        anchors.centerIn: parent
        spacing: 18
        Text {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: qsTr("Your Vehicle")
            font.pixelSize: 20
            font.weight: Font.Bold
            font.family: "Lato"
            color: Style.alphaColor("#FFFFFF",0.5)
        }

        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: qsTr("Raemon Model R 2024")
            font.pixelSize: 14
            font.family: "Lato"
            color: Style.alphaColor("#FFFFFF",0.5)
        }

        VehicleSkeletonTile {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            onComponentSelected: (index)=> {
                                    root.componentSelected(index)
                                 }
        }
    }
}
