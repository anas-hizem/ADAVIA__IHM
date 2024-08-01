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
            Layout.preferredWidth: parent.width * 0.10
            Layout.preferredHeight: parent.height

            ColumnLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height: parent.height
                Item {Layout.preferredHeight: 10 }


                HomeButton {
                    checked: true
                    setIcon: "qrc:/assets/icons/Home Icon.svg"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = homeScreencomp
                }
                HomeButton {
                    setIcon: "qrc:/assets/icons/camera.png"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = cameraStreaming
                }

                HomeButton {
                    setIcon: "qrc:/assets/icons/sensor.svg"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = sensor
                }

                HomeButton {
                    setIcon: "qrc:/assets/icons/Navigation Icon.svg"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    onClicked: sideLoader.sourceComponent = navigationScreen
                }


                Item {Layout.preferredHeight: 10 }
            }
        }
        Item {
            Layout.preferredWidth: parent.width - (parent.width * 0.10)
            Layout.preferredHeight: parent.height

            Loader {
                id: sideLoader
                anchors.fill: parent
                sourceComponent: homeScreen
            }
        }
    }


    Component {
        id: homeScreencomp
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
    // Component {
    //     id: carScreen
    //     CarScreen {
    //         onPowerOff: root.powerOff()
    //     }
    // }
    // Component {
    //     id: thermoScreen
    //     ThermoScreen {}
    // }
    // Component {
    //     id: musicScreen
    //     MusicScreen {}
    // }
}
