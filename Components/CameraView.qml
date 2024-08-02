import QtMultimedia 5.15
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: cameraContainer
    color: "#151515"
    width: 1000
    height: 800
    radius: 15

    Rectangle {
        id: cameraAvantArea
        width: (cameraContainer.width - 30) / 2
        height: (cameraContainer.height - 30) / 2
        color: "#39B54B"
        anchors.left: cameraContainer.left
        anchors.top: cameraContainer.top
        anchors.leftMargin: 10
        anchors.topMargin: 10
        radius: 15

        Rectangle {
            id: cameraAvantRectangle
            width: cameraAvantArea.width - 20
            height: cameraAvantArea.height - 20
            anchors.centerIn: cameraAvantArea
            color: "#39B54B"
            Camera {
                id: cameraStreamingAvant
            }
            VideoOutput {
                source: cameraStreamingAvant
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectCrop
                visible: cameraStreamingAvant.cameraStatus === Camera.ActiveStatus
            }
            Image {
                id: placeholderImageAvant
                source: "qrc:/assets/icons/logoactiawhite.png"
                width: parent.width
                anchors.centerIn: parent
                visible: cameraStreamingAvant.cameraStatus !== Camera.ActiveStatus
            }
        }
    }

    Rectangle {
        id: cameraArriereArea
        width: (cameraContainer.width - 30) / 2
        height: (cameraContainer.height - 30) / 2
        color: "#EDF4F5"
        anchors.right: cameraContainer.right
        anchors.top: cameraContainer.top
        anchors.rightMargin: 10
        anchors.topMargin: 10
        radius: 15

        Rectangle {
            id: cameraArriereRectangle
            width: cameraArriereArea.width - 20
            height: cameraArriereArea.height - 20
            anchors.centerIn: cameraArriereArea
            color: "#EDF4F5"
            Camera {
                id: cameraStreamingArriere
            }
            VideoOutput {
                source: cameraStreamingArriere
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectCrop
                visible: cameraStreamingArriere.cameraStatus === Camera.ActiveStatus
            }
            Image {
                id: placeholderImageArriere
                source: "qrc:/assets/icons/logoactia.png"
                width: parent.width
                anchors.centerIn: parent
                visible: cameraStreamingArriere.cameraStatus !== Camera.ActiveStatus
            }
        }
    }

    Rectangle {
        id: cameraRetroGArea
        width: (cameraContainer.width - 30) / 2
        height: (cameraContainer.height - 30) / 2
        color: "#90969D"
        anchors.left: cameraContainer.left
        anchors.bottom: cameraContainer.bottom
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        radius: 15

        Rectangle {
            id: cameraRetroGRectangle
            width: cameraRetroGArea.width - 20
            height: cameraRetroGArea.height - 20
            anchors.centerIn: cameraRetroGArea
            color: "#90969D"
            Camera {
                id: cameraStreamingRetroG
            }
            VideoOutput {
                source: cameraStreamingRetroG
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectCrop
                visible: cameraStreamingRetroG.cameraStatus === Camera.ActiveStatus
            }
            Image {
                id: placeholderImageRetroG
                source: "qrc:/assets/icons/logoactiawhite.png"
                width: parent.width
                anchors.centerIn: parent
                visible: cameraStreamingRetroG.cameraStatus !== Camera.ActiveStatus
            }
        }
    }

    Rectangle {
        id: cameraRetroDArea
        width: (cameraContainer.width - 30) / 2
        height: (cameraContainer.height - 30) / 2
        color: "#2BC3EA"
        anchors.right: cameraContainer.right
        anchors.bottom: cameraContainer.bottom
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        radius: 15

        Rectangle {
            id: cameraRetroDRectangle
            width: cameraRetroDArea.width - 20
            height: cameraRetroDArea.height - 20
            anchors.centerIn: cameraRetroDArea
            color: "#2BC3EA"
            Camera {
                id: cameraStreamingRetroD
            }
            VideoOutput {
                source: cameraStreamingRetroD
                anchors.fill: parent
                fillMode: VideoOutput.PreserveAspectCrop
                visible: cameraStreamingRetroD.cameraStatus === Camera.ActiveStatus
            }
            Image {
                id: placeholderImageRetroD
                source: "qrc:/assets/icons/logoactiagray.png"
                width: parent.width
                anchors.centerIn: parent
                visible: cameraStreamingRetroD.cameraStatus !== Camera.ActiveStatus
            }
        }
    }
}
