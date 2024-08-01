import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item {
    id: root
    signal completed()
    property alias title:  title
    property bool on: true
    onOnChanged: {
        if(!on){
            opacityTimer.start()
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        Text {
            id: title
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("ADAVIA")
            font.family: "Lato"
            font.letterSpacing: -12
            font.pixelSize: 96
            font.weight: Font.ExtraBold
            color: "#000000"
            onOpacityChanged: {
                if(opacity === 0 && root.on){
                    root.completed()
                }
            }
        }

        Text {
            id: subTitle
            Layout.alignment: Qt.AlignHCenter
            text: qsTr("It’s your drive.")
            font.family: "Lato"
            font.italic: true
            font.pixelSize: 20
            font.weight: Font.ExtraLight
            color: "#000000"
            opacity: title.opacity
        }
    }

    Text {
        id: loading
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 100
        visible: false
        text: root.on ? qsTr("Loading...") : qsTr("Powering off...")
        font.family: "Lato"
        font.pixelSize: 20
        font.weight: Font.Bold
        color: "#000000"
        opacity: title.opacity
    }

    Timer {
        id: loadingTimer
        running: false
        repeat: false
        interval: 500
        onTriggered: {
            loading.visible = true
            opacityTimer.start()
        }
    }

    Timer {
        id: opacityTimer
        running: false
        repeat: false
        interval: 1000
        onTriggered: {
            opacityAnimation.start()
        }
    }

    NumberAnimation {
        id: opacityAnimation
        target: title
        property: "opacity"
        from: 1
        to: 0
        duration: 1000 // Duration in milliseconds
    }

    Component.onCompleted: loadingTimer.start()
}
