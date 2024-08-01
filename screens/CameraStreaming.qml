import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
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
            CameraView {}

        }

        ColumnLayout {
            spacing: 10
            Layout.row: 0
            Layout.column: 1
            Layout.columnSpan: 1
            Layout.rowSpan: 1

            DateTimeTile {}

            CameraController {}


        }
    }
    // RowLayout {
    //     anchors.fill: parent
    //     anchors.rightMargin: 20
    //     anchors.bottomMargin: 20
    //     anchors.topMargin: 30
    //     spacing: 10
    //     CameraView {}
    //     Rectangle {
    //         color: "#BDD248"
    //         Layout.preferredWidth: 600
    //         Layout.preferredHeight: 600
    //         radius: 15

    //         Image {
    //             anchors.centerIn: parent
    //             source: "qrc:/assets/navette.png"
    //             fillMode: Image.PreserveAspectFit
    //             width: 600
    //             height: 600
    //         }
    //     }
    // }
}