import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: root
    color: "#151515"
    Layout.preferredWidth: 300
    Layout.preferredHeight: 300
    radius: 15

    // Image to display corresponding object
    Image {
        id: objectImage
        anchors.fill : parent
        anchors.margins: 10
        source: "qrc:/assets/image/Light.png"
        fillMode: Image.PreserveAspectFit
        opacity: 0.2
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
                case "green_sign":
                    objectImage.source = "qrc:/assets/image/2LightsGreenLight.png";
                    objectImage.opacity = 1;
                    break;
                case "red_sign":
                    objectImage.source = "qrc:/assets/image/2LightsRedLight.png";
                    objectImage.opacity = 1;
                    break;
                default:
                    objectImage.source = "qrc:/assets/image/Light.png";
                    objectImage.opacity = 0.2;
            }
        }
    }
}
