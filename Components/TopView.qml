import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    color: "#151515"
    width: 1000
    height: 600
    radius: 15
    // Image de la navette en vue de dessus
    Image {
        id: navetteImage
        source: "qrc:/assets/navette-top-view-.png"
        anchors.centerIn: parent
    }
    // Liste des capteurs ultrasoniques avec leur position
    Repeater {
        model: ListModel {
            ListElement { x: 70; y: 360; label: "Avant Gauche"; angle: 0; }
            ListElement { x: 70; y: 190; label: "Avant Droit"; angle: 0; }
            ListElement { x: 880; y: 360; label: "Arrière Gauche"; angle: 180; }
            ListElement { x: 880; y: 190; label: "Arrière Droit"; angle: 180; }
            ListElement { x: 450; y: 440; label: "Côté Gauche"; angle: 270; }
            ListElement { x: 450; y: 110; label: "Côté Droit"; angle: 90; }
        }

        Item {
            width: 50
            height: 50

            Image {
                id: waveImage
                anchors.centerIn: parent
                source: "qrc:/assets/icons/green-wave-01.png"
                width: 350
                height: 250
                property int frame: 0
                property var waveImages: ["qrc:/assets/icons/green-wave-01.png", "qrc:/assets/icons/green-wave-02.png", "qrc:/assets/icons/green-wave-03.png", "qrc:/assets/icons/green-wave-04.png", "qrc:/assets/icons/green-wave-05.png"]
                property int interval: 300

                Timer {
                    interval: waveImage.interval // Intervalle de temps pour changer les images
                    running: true
                    repeat: true
                    onTriggered: {
                        waveImage.frame = (waveImage.frame + 1) % waveImage.waveImages.length;
                        waveImage.source = waveImage.waveImages[waveImage.frame];
                    }
                }

                transform: Rotation {
                    id: waveRotation
                    origin.x: waveImage.width / 2
                    origin.y: waveImage.height / 2
                    angle: model.angle
                }

                // Fonction pour ajuster les images et l'intervalle de temps
                function updateAppearance(distance) {
                    if (distance < 1) {
                        waveImage.waveImages = ["qrc:/assets/icons/red-wave-01.png", "qrc:/assets/icons/red-wave-02.png", "qrc:/assets/icons/red-wave-03.png", "qrc:/assets/icons/red-wave-04.png", "qrc:/assets/icons/red-wave-05.png"];
                        waveImage.interval = 100;
                    } else if (distance >= 1 && distance <= 2) {
                        waveImage.waveImages = ["qrc:/assets/icons/orange-wave-01.png", "qrc:/assets/icons/orange-wave-02.png", "qrc:/assets/icons/orange-wave-03.png", "qrc:/assets/icons/orange-wave-04.png", "qrc:/assets/icons/orange-wave-05.png"];
                        waveImage.interval = 200;
                    } else {
                        waveImage.waveImages = ["qrc:/assets/icons/green-wave-01.png", "qrc:/assets/icons/green-wave-02.png", "qrc:/assets/icons/green-wave-03.png", "qrc:/assets/icons/green-wave-04.png", "qrc:/assets/icons/green-wave-05.png"];
                        waveImage.interval = 300;
                    }
                }
            }

            // Position des capteurs
            x: model.x
            y: model.y
            Text {
                text: {
                    var distance;
                    switch (model.label) {
                        case "Avant Gauche": distance = ultrasonSensor.avantGauche; break;
                        case "Avant Droit": distance = ultrasonSensor.avantDroit; break;
                        case "Arrière Gauche": distance = ultrasonSensor.arriereGauche; break;
                        case "Arrière Droit": distance = ultrasonSensor.arriereDroit; break;
                        case "Côté Gauche": distance = ultrasonSensor.coteGauche; break;
                        case "Côté Droit": distance = ultrasonSensor.coteDroit; break;
                        default: distance = 0;
                    }
                    waveImage.updateAppearance(distance);
                    return distance.toFixed(2) + " m";
                }
                anchors.centerIn: parent
                font.pixelSize: 30
                color: "white"
            }
        }
    }

    // // MouseAreas pour les textes avec les positions des capteurs

    // MouseArea {
    //     id: textAvantDArea
    //     x: 300
    //     y: 200
    //     width: 200
    //     height: 100

    //     Column {
    //         anchors.centerIn: parent
    //         spacing: 10
    //         Text {
    //             text: "Capteur Avant Droite"
    //             font.pixelSize: 25
    //             font.bold: true
    //         }
    //         Text {
    //             id: distanceAvantDText
    //             text: "Distance: " + ultrasonSensor.avantDroit + " m"
    //             color: "black"
    //             font.pixelSize: 20
    //         }
    //     }
    // }
    // MouseArea {
    //     id: textAvantGArea
    //     x: 300
    //     y: 750
    //     width: 200
    //     height: 100

    //     Column {
    //         anchors.centerIn: parent
    //         spacing: 10
    //         Text {
    //             text: "Capteur Avant Gauche"
    //             font.pixelSize: 25
    //             font.bold: true
    //         }
    //         Text {
    //             id: distanceAvantGText
    //             text: "Distance: " + ultrasonSensor.avantGauche + " m"
    //             color: "black"
    //             font.pixelSize: 20
    //         }
    //     }
    // }
    // MouseArea {
    //     id: textArriereGArea
    //     x: 1350
    //     y: 800
    //     width: 200
    //     height: 100

    //     Column {
    //         anchors.centerIn: parent
    //         spacing: 10
    //         Text {
    //             text: "Capteur Arrière Gauche"
    //             font.pixelSize: 25
    //             font.bold: true
    //         }
    //         Text {
    //             id: distanceArriereGText
    //             text: "Distance: " + ultrasonSensor.arriereGauche + " m"
    //             color: "black"
    //             font.pixelSize: 20
    //         }
    //     }
    // }
    // MouseArea {
    //     id: textArriereDArea
    //     x: 1350
    //     y: 150
    //     width: 200
    //     height: 100

    //     Column {
    //         anchors.centerIn: parent
    //         spacing: 10
    //         Text {
    //             text: "Capteur Arrière Droite"
    //             font.pixelSize: 25
    //             font.bold: true
    //         }
    //         Text {
    //             id: distanceArriereDText
    //             text: "Distance: " + ultrasonSensor.arriereDroit + " m"
    //             color: "black"
    //             font.pixelSize: 20
    //         }
    //     }
    // }
    // MouseArea {
    //     id: textCoteDArea
    //     x: 850
    //     y: 150
    //     width: 200
    //     height: 100

    //     Column {
    //         anchors.centerIn: parent
    //         spacing: 10
    //         Text {
    //             text: "Capteur Côté Droite"
    //             font.pixelSize: 25
    //             font.bold: true
    //         }
    //         Text {
    //             id: distanceCoteDText
    //             text: "Distance: " + ultrasonSensor.coteDroit + " m"
    //             color: "black"
    //             font.pixelSize: 20
    //         }
    //     }
    // }
    // MouseArea {
    //     id: textCoteGArea
    //     x: 850
    //     y: 800
    //     width: 200
    //     height: 100

    //     Column {
    //         anchors.centerIn: parent
    //         spacing: 10
    //         Text {
    //             text: "Capteur Côté Gauche"
    //             font.pixelSize: 25
    //             font.bold: true
    //         }
    //         Text {
    //             id: distanceCoteGText
    //             text: "Distance: " + ultrasonSensor.coteGauche + " m"
    //             color: "black"
    //             font.pixelSize: 20
    //         }
    //     }
    // }

    // // Canvas pour tracer les lignes entre les capteurs et les textes
    // Canvas {
    //     id: linesCanvas
    //     width: parent.width
    //     height: parent.height
    //     anchors.fill: parent
    //     onPaint: {
    //         var ctx = getContext("2d");
    //         ctx.clearRect(0, 0, width, height);

    //         // Tracer les lignes
    //         ctx.beginPath();
    //         ctx.moveTo(520, 380); // Avant Droit
    //         ctx.lineTo(textAvantDArea.x  + textAvantDArea.width / 2, textAvantDArea.y + 40 + textAvantDArea.height / 2);
    //         ctx.stroke();

    //         ctx.beginPath();
    //         ctx.moveTo(520,620); // Avant Gauche
    //         ctx.lineTo(textAvantGArea.x + textAvantGArea.width / 2, textAvantGArea.y - 40  + textAvantGArea.height / 2);
    //         ctx.stroke();

    //         ctx.beginPath();
    //         ctx.moveTo(1370, 620); // Arrière Gauche
    //         ctx.lineTo(textArriereGArea.x  + textArriereGArea.width / 2, textArriereGArea.y - 40 + textArriereGArea.height / 2);
    //         ctx.stroke();

    //         ctx.beginPath();
    //         ctx.moveTo(1370, 370); // Arrière Droit
    //         ctx.lineTo(textArriereDArea.x + textArriereDArea.width / 2, textArriereDArea.y + 40 + textArriereDArea.height / 2);
    //         ctx.stroke();

    //         ctx.beginPath();
    //         ctx.moveTo(970, 350); // Côté Droit
    //         ctx.lineTo(textCoteDArea.x + textCoteDArea.width / 2, textCoteDArea.y + 40 + textCoteDArea.height / 2);
    //         ctx.stroke();

    //         ctx.beginPath();
    //         ctx.moveTo(970, 660); // Côté Gauche
    //         ctx.lineTo(textCoteGArea.x + textCoteGArea.width / 2, textCoteGArea.y  - 40 + textCoteGArea.height / 2);
    //         ctx.stroke();
    //     }
    // }
}
