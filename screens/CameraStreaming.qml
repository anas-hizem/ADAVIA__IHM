import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

import "../Components"

Item {
    anchors.fill: parent
    GridLayout {
        id: grid
        anchors.fill: parent
        anchors.rightMargin: 50
        anchors.bottomMargin: 20
        anchors.topMargin: 30
        rows: 1
        columns: 2
        rowSpacing: 20
        columnSpacing: 10

        ColumnLayout {
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Rectangle {
                id: cameraContainer
                color: "#151515"
                width: 1000
                height: 800
                radius: 15
                property Camera cameraAvant: cameraStreamingAvant
                property Camera cameraArriere: cameraStreamingArriere
                property Camera cameraRetroG: cameraStreamingRetroG
                property Camera cameraRetroD: cameraStreamingRetroD

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


        }

        ColumnLayout {
            spacing: 10
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            DateTimeTile {}

            Rectangle {
                id: navetteContainer
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
                    width: 100
                    height: 100
                    anchors.top: navetteContainer.top
                    anchors.topMargin: 40
                    anchors.left: navetteContainer.left
                    anchors.leftMargin: 10
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        cameraStreamingAvant.start();
                        cameraStreamingArriere.stop()
                        cameraStreamingRetroD.stop()
                        cameraStreamingRetroG.stop()
                    }
                    Text {
                        z: 2
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
                    anchors.top: navetteContainer.top
                    anchors.topMargin: 10
                    anchors.right: navetteContainer.right
                    anchors.rightMargin: 10
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        cameraStreamingArriere.start();
                        cameraStreamingAvant.stop()
                        cameraStreamingRetroD.stop()
                        cameraStreamingRetroG.stop()
                    }
                    Text {
                        z: 2
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
                    anchors.bottom: navetteContainer.bottom
                    anchors.bottomMargin: 10
                    anchors.right: navetteContainer.right
                    anchors.rightMargin: 10
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        cameraStreamingRetroG.start();
                        cameraStreamingAvant.stop()
                        cameraStreamingRetroD.stop()
                        cameraStreamingArriere.stop()
                    }
                    Text {
                        z: 2
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
                    anchors.bottom: navetteContainer.bottom
                    anchors.bottomMargin: 20
                    anchors.left: navetteContainer.left
                    anchors.leftMargin: 10
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        cameraStreamingRetroD.start();
                        cameraStreamingAvant.stop()
                        cameraStreamingRetroG.stop()
                        cameraStreamingArriere.stop()
                    }
                    Text {
                        z: 2
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

        }
    }
}
