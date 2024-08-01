import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15//import Qt5Compat.GraphicalEffects
Item{
    id: root
    clip: true

    property color color: "#FFFFFF"
    property string source: "qrc:/assets/seatIcons/mdi--car-seat.svg"

    Image {
        id: imageIcon
        sourceSize: Qt.size(60,60)
        anchors.centerIn: parent
        source: root.source
    }

    // ColorOverlay {
    //     z:1
    //     anchors.fill: imageIcon
    //     source: imageIcon
    //     color: root.color
    // }
}
