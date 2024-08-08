import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15


Rectangle {
    color: "#151515"
    Layout.preferredWidth: 300
    Layout.preferredHeight: 300
    radius: 15

    RowLayout {
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: countText
            text: "Count: 0"
            anchors.centerIn: parent
            font.pixelSize: 30
            color: 'white'
            font.family: "Lato"
            font.weight: Font.ExtraBold

        }
        //Connexion au signal countReceived pour mettre à jour le texte
        Connections {
            target: tcpSocket
            onCountReceived: {
                countText.text = "Count: " + count
            }
        }
    }
}


