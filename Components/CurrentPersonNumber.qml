import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    color: "#151515"
    width: 250
    height: 250
    radius: 15

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10

        Rectangle {
            width: (root.width - 20) / 2 // Adjust width to account for margins
            height: root.height - 20
            radius: 15
            color: "#151515"

            Image {
                anchors.centerIn: parent
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/assets/image/seat.png"
            }
        }

        Rectangle {
            width: (root.width - 20) / 2 // Adjust width to account for margins
            height: root.height - 20
            radius: 15
            color: "#151515"

            Text {
                id: objectText
                text: "0"
                anchors.centerIn: parent
                font.pixelSize: 60
                color: 'white'
                font.family: "Lato"
                font.weight: Font.ExtraBold
            }
        }
    }

    // Connexion au signal objectReceived pour mettre à jour le texte et l'image
    Connections {
        target: tcpSocket
        function onCountReceived(current, entry, exit) {
            objectText.text = current
        }
    }
}
