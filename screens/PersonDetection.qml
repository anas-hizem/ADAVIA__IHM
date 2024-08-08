import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
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
        rows: 2
        columns: 2
        rowSpacing: 20
        columnSpacing: 10

        ColumnLayout {
            spacing: 20


            PersonDetectionCamera {
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.row: 0
                Layout.column: 0
                Layout.alignment: Qt.AlignHCenter
            }

            RowLayout {
                spacing: 20
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.row: 1
                Layout.column: 0
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter


                EntryPersonDetected {}

                ExitPersonDetected {}

                CurrentPersonNumber {}


            }


        }

        ColumnLayout {
            spacing: 20
            Layout.columnSpan: 2
            Layout.rowSpan: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.row: 0
            Layout.column: 1
            Layout.alignment: Qt.AlignHCenter

            DateTimeTile {}

            BatteryTile {}

            NotificationTile {

                Layout.columnSpan: 2
                Layout.rowSpan: 1
                Layout.row: 1
                Layout.column: 1
                Layout.alignment: Qt.AlignHCenter
            }

        }
    }

}



