import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id:root
    color: "#151515"
    Layout.preferredWidth: 300
    Layout.preferredHeight: 300
    radius: 15

    // Image to display corresponding object
    Image {
        id: objectImage
        //anchors.centerIn: parent
        anchors.fill : parent
        // width: root.width
        // height: root.height
        anchors.margins: 10
        source: "qrc:/assets/image/stop_panel.png"
        fillMode: Image.PreserveAspectFit
        opacity : 0.1

    }

    // Text to display the detected object name and score
    // Text {
    //     id: objectText
    //     text: "No Object Detected"
    //     Layout.alignment: Qt.AlignCenter
    //     font.pixelSize: 30
    //     color: 'white'
    //     font.family: "Lato"
    //     font.weight: Font.ExtraBold
    // }

    // Connexion au signal objectReceived pour mettre à jour le texte et l'image
    Connections {
        target: tcpSocket
        function onObjectReceived(className, score) {
            switch (className) {
                case "stop_panel":
                    objectImage.source = "qrc:/assets/image/stop_panel.png";
                    objectImage.opacity = 1;
                    break;
                default:
                    objectImage.source = "qrc:/assets/image/stop_panel.png";
                    objectImage.opacity = 0.1;
            }
        }
    }
}
