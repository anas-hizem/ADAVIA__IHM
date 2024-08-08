import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
//import Qt5Compat.GraphicalEffects
import "../Components"

Item {
    anchors.fill: parent


    GridLayout {
        id: grid
        anchors.fill: parent
        anchors.leftMargin: 30
        anchors.rightMargin: 100
        anchors.bottomMargin: 20
        anchors.topMargin: 30
        rows: 2
        columns: 2
        rowSpacing: 10
        columnSpacing: 10

        ColumnLayout {
            spacing: 10

            NavetteImage {
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
                Layout.alignment: Qt.AlignHCenter

                MeteoWidget {}

                MusicSmallTile {}
            }
        }
        ColumnLayout {
            spacing: 20

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

            }
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
