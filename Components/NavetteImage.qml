import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id:root
    color: "#BDD248"
    Layout.preferredWidth: 1000
    Layout.preferredHeight: 600
    radius: 15

    Image {
        anchors.centerIn: parent
        source: "qrc:/assets/navette.png"
        fillMode: Image.PreserveAspectFit
        width: 600
        height: 600
    }
}



