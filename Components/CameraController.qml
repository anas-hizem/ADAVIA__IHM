import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import "../controls"


Rectangle {
    id:navetteContainer
    color: "#BDD248"
    Layout.preferredWidth: 400
    Layout.preferredHeight: 600
    radius: 15


    Text {
        id: titte
        text: qsTr("Choose your camera view")
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        color: 'black'
    }
    Image {
        id: navetteImage
        anchors.centerIn: parent
        source: "qrc:/assets/navette.png"
        fillMode: Image.PreserveAspectFit
        width: 500
        height: 500
    }

    Item {
        id: cameraAvant
        width: 1
        height: 1
        anchors.top: navetteImage.top
        anchors.topMargin: 70
        anchors.left: navetteContainer.left
        anchors.leftMargin: 100
    }

    Item {
        id: cameraArriere
        width: 1
        height: 1
        anchors.top: navetteImage.top
        anchors.topMargin: 70
        anchors.right: navetteContainer.right
        anchors.rightMargin: 80
    }

    Item {
        id: cameraRetroG
        width: 1
        height: 1
        anchors.bottom: navetteImage.bottom
        anchors.bottomMargin: 240
        anchors.right: navetteContainer.right
        anchors.rightMargin: 160
    }

    Item {
        id: cameraRetroD
        width: 1
        height: 1
        anchors.bottom: navetteImage.bottom
        anchors.bottomMargin: 250
        anchors.left: navetteContainer.left
        anchors.leftMargin: 30
    }

    MouseArea {
        id: textAvantArea
        width: 50
        height: 50
        anchors.top: navetteContainer.top
        anchors.topMargin: 40
        anchors.left: parent.left
        anchors.leftMargin: -50
        cursorShape: Qt.PointingHandCursor;
        onClicked: {
            CameraView.cameraStreamingAvant.start();
            CameraView.cameraStreamingArriere.stop()
            CameraView.cameraStreamingRetroD.stop()
            CameraView.cameraStreamingRetroG.stop()
        }
        Text {
            z:2
            text: "Avant"
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
        }
    }
    MouseArea {
        id: textArriereArea
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: -80
        cursorShape: Qt.PointingHandCursor;
        onClicked: {
            CameraView.cameraStreamingArriere.start()
            CameraView.cameraStreamingAvant.stop()
            CameraView.cameraStreamingRetroD.stop()
            CameraView.cameraStreamingRetroG.stop()
        }
        Text {
            z:2
            text: "Arrière"
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
        }
    }
    MouseArea {
        id: textRetroGArea
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -10
        anchors.right: parent.right
        anchors.rightMargin: -60
        cursorShape: Qt.PointingHandCursor;
        onClicked: {
            CameraView.cameraStreamingRetroG.start()
            CameraView.cameraStreamingAvant.stop()
            CameraView.cameraStreamingRetroD.stop()
            CameraView.cameraStreamingArriere.stop()
        }
        Text {
            z:2
            text: "Rétro G"
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
        }
    }

    MouseArea {
        id: textRetroDArea
        width: 100
        height: 100
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -20
        anchors.left: parent.left
        anchors.leftMargin: -50
        cursorShape: Qt.PointingHandCursor;
        onClicked: {
            CameraView.cameraStreamingAvant.stop()
            CameraView.cameraStreamingRetroG.stop()
            CameraView.cameraStreamingArriere.stop()
            CameraView.cameraStreamingRetroD.start()
        }
        Text {
            z:2
            text: "Rétro D"
            anchors.centerIn: parent
            font.pixelSize: 25
            font.bold: true
        }
    }
    Canvas {
        id: linesCanvas
        width: parent.width
        height: parent.height
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            // Tracer les lignes
            ctx.beginPath();
            ctx.moveTo(cameraAvant.x  + cameraAvant.width / 2, cameraAvant.y + cameraAvant.height / 2);
            ctx.lineTo(textAvantArea.x  + textAvantArea.width / 2, textAvantArea.y + textAvantArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(cameraArriere.x + cameraArriere.width / 2, cameraArriere.y + cameraArriere.height / 2);
            ctx.lineTo(textArriereArea.x + textArriereArea.width / 2, textArriereArea.y  + textArriereArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(cameraRetroG.x + cameraRetroG.width / 2, cameraRetroG.y + cameraRetroG.height / 2);
            ctx.lineTo(textRetroGArea.x + textRetroGArea.width / 2, textRetroGArea.y + textRetroGArea.height / 2);
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(cameraRetroD.x + cameraRetroD.width / 2, cameraRetroD.y + cameraRetroD.height / 2);
            ctx.lineTo(textRetroDArea.x + textRetroDArea.width / 2, textRetroDArea.y + textRetroDArea.height / 2);
            ctx.stroke();
        }
    }
}
