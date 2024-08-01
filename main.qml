import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: qsTr("ADAVIA IHM")
    color: "#BDD248"

    Loader {
        id: splashScreenLoader
        anchors.fill: parent
        sourceComponent: splashScreenPage
        onLoaded: {
            splashScreenLoader.item.title.opacity = 1
            splashScreenLoader.item.on = true
        }
    }

    Loader {
        id: mainScreenLoader
        opacity: 0
        anchors.fill: parent
        sourceComponent: mainScreenPage
    }

    Component {
        id: splashScreenPage
        SplashScreens {
            onCompleted: {
                opacityAnimation.start()
            }
        }
    }

    Component {
        id: mainScreenPage
        MainPage {
            onPowerOff: {
                splashTimerOff.start()
            }
        }
    }

    NumberAnimation {
        id: opacityAnimation
        target: mainScreenLoader
        property: "opacity"
        from: 0
        to: 1
        duration: 1000 // Duration in milliseconds
    }

    NumberAnimation {
        id: powerOffAnimation
        target: mainScreenLoader
        property: "opacity"
        from: 1
        to: 0
        duration: 1000 // Duration in milliseconds
    }

    NumberAnimation {
        id: powerOffAnimationSplash
        target: splashScreenLoader
        property: "opacity"
        from: 0
        to: 1
        duration: 1000 // Duration in milliseconds
    }

    Timer {
        id: splashTimerOff
        running: false
        repeat: false
        interval: 1000
        onTriggered: {
            powerOffAnimation.start()
            showSplashOff.start()
        }
    }

    Timer {
        id: showSplashOff
        running: false
        repeat: false
        interval: 500
        onTriggered: {
            splashScreenLoader.item.title.opacity = 1
            splashScreenLoader.item.on = false
            powerOffAnimationSplash.start()
        }
    }
}
