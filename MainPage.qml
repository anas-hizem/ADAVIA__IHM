import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "controls"
import "screens"

Item {
    id: root
    anchors.fill: parent
    signal powerOff()

    RowLayout {
        anchors.fill: parent
        spacing: 0
        Item {
            Layout.preferredWidth: parent.width * 0.15
            Layout.preferredHeight: parent.height

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height: parent.height
                Item {Layout.preferredHeight: 10 }


                HomeButton {
                    checked: true
                    setIcon: "qrc:/assets/image/home.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = homeScreen
                }
                HomeButton {
                    setIcon: "qrc:/assets/icons/camera.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = cameraStreaming
                }

                HomeButton {
                    setIcon: "qrc:/assets/image/sensor.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = sensor
                }

                HomeButton {
                    setIcon: "qrc:/assets/image/naviagtion.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = navigationScreen
                }
                HomeButton {
                    setIcon: "qrc:/assets/icons/bus.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = personDetection
                }
                HomeButton {
                    setIcon: "qrc:/assets/icons/feu-de-circulation.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = panelDetection
                }
                // HomeButton {
                //     setIcon: "qrc:/assets/icons/Climate Control Icon.svg"
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //     onClicked: sideLoader.sourceComponent = thermoScreen
                // }
                // HomeButton {
                //     setIcon: "qrc:/assets/icons/Media Icon.svg"
                //     Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                //     onClicked: sideLoader.sourceComponent = musicScreen
                // }

                Item {Layout.preferredHeight: 10 }
            }
        }
        Item {
            Layout.preferredWidth: parent.width - (parent.width * 0.15)
            Layout.preferredHeight: parent.height

            Loader {
                id: sideLoader
                anchors.fill: parent
                sourceComponent: homeScreen
            }
        }
    }


    Component {
        id: homeScreen
        HomeScreen {}
    }
    Component {
        id: cameraStreaming
        CameraStreaming {}
    }
    Component {
        id: sensor
        UltrasonicSensor {}
    }
    Component {
        id: navigationScreen
        NavigationScreen {}
    }
    Component {
        id: carScreen
        CarScreen {
            onPowerOff: root.powerOff()
        }
    }

    Component {
        id: personDetection
        PersonDetection {}
    }

    Component {
        id: panelDetection
        PanelDetection {}
    }

    Component {
        id: thermoScreen
        ThermoScreen {}
    }
    Component {
        id: musicScreen
        MusicScreen {}
    }
}
