import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15


Rectangle {
    id :root
    color: "#151515"
    width: 1000
    height: 500
    radius: 15

    Button {
        text: "Open PyQt5 Video Capture"
        anchors.centerIn: parent
        onClicked: {
            // Appeler une méthode C++ pour lancer l'application PyQt5
            pyqtLauncher.launchPyQtAppPanelDetection()
        }
    }
}
