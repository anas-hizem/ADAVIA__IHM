import QtQuick 2.15
import QtLocation 5.11
import QtPositioning 5.11
import GeneralMagic 2.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

import "../controls"

Rectangle {
    id:mapArea
    color: "#546472"
    radius: 15
    function distance(meters) {
        return meters >= 1000 ? (meters / 1000).toFixed(3) + " Km" : meters.toFixed(0) + " m";
    }
    //GeneralMagic
    property var destinationCoordinates: null
    property var startCoordinates: ServicesManager.createCoordinates(36.899108, 10.187172)  // Paris coordinates
    property var updater: ServicesManager.contentUpdater(ContentItem.Type.RoadMap)
    Component.onCompleted:
    {
        ServicesManager.settings.allowInternetConnection = true
        ServicesManager.settings.token = __my_secret_token
        updater.autoApplyWhenReady = true
        updater.update()
    }

    Rectangle {
        width: mapArea.width
        height: mapArea.height
        radius: 20
        MapView
        {
            id:geomapview
            anchors.fill : mapArea
            clip: true
            width: mapArea.width
            height: mapArea.height
            viewAngle: 35
            cursorVisibility: false
            viewPerspective: MapView.ViewPerspective.View3D
            buildingsVisibility: MapView.BuildingsVisibility.Show3D
            detailsQualityLevel: MapView.DetailsQualityLevel.Medium
            onRouteSelected:
            {
                routeCollection.mainRoute = route
                centerOnRoute(route)
                console.log("Selected Route Is : " + route.summary)
            }
            ColumnLayout {
                        anchors.fill: parent
                        anchors.topMargin: 15
                        anchors.leftMargin: 15
                        anchors.rightMargin: 700
                        anchors.bottomMargin: 30

                TextField {
                    id: searchBar
                    Layout.fillWidth: true
                    placeholderText: qsTr("Where would you like to go?")
                    onTextChanged: searchTimer.restart()
                    onEditingFinished: searchService.searchNow()
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    color: Qt.rgba(0,0,0,0.5)
                    visible: searchBar.focus
                    ListView {
                        id: searchList
                        anchors.fill: parent
                        clip: true
                        model: searchService
                        function distance(meters)
                        {
                            return meters >= 1000 ? (meters / 1000.).toFixed(3) + " Km" :  meters.toFixed(0) + " m";
                        }
                        delegate: Item {
                            height: row.height
                            RowLayout {
                                id: row
                                spacing: 15
                                IconView {
                                    iconSource: landmark.icon
                                    Layout.maximumHeight: row.height
                                    Layout.maximumWidth: row.height
                                    width: 40
                                    height: 40
                                }
                                ColumnLayout {
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    Text {
                                        Layout.fillWidth: true
                                        text: landmark.name + " (" + searchList.distance(landmark.coordinates.distance(searchService.referencePoint)) + ")"
                                        color: "white"
                                        font.pixelSize: 16
                                        wrapMode: Text.WrapAnywhere
                                    }
                                    Text {
                                        Layout.fillWidth: true
                                        text: landmark.description
                                        color: "white"
                                        font.pixelSize: 13
                                        font.italic: true
                                        wrapMode: Text.WrapAnywhere
                                    }
                                    Rectangle{
                                        Layout.fillWidth: true
                                        color: "white"
                                        height: 1
                                    }
                                }
                            }
                            MouseArea {
                                anchors.fill: row
                                onClicked: {
                                    destinationCoordinates = searchService.get(index).coordinates;
                                    console.log("Destination coordinates:", destinationCoordinates);
                                    geomapview.centerOnCoordinates(searchService.get(index).coordinates, -1);
                                    searchBar.focus = false;                            }
                            }
                        }
                    }
                }
                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
            Rectangle{
                z:5
                visible: navigationService.active
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.left: parent.left
                anchors.leftMargin: 20
                implicitHeight: 140
                implicitWidth: 420
                radius: 20
                color: "#439df3"

                RowLayout{
                    width: parent.width
                    spacing: 0
                    anchors.centerIn: parent
                    Item{
                        Layout.alignment: Qt.AlignLeft
                        Layout.preferredWidth: parent.width * 0.33
                        Layout.fillHeight: true
                        RowLayout{
                            anchors.centerIn: parent
                            spacing: 20
                            DynamicIconView {
                                width: 100
                                height: 100
                                arrowInner: "White"
                                arrowOuter: "White"
                                slotInner: "Grey"
                                slotOuter: arrowOuter
                                iconSource: navigationService.currentInstruction.nextTurnDynamicIcon
                            }

                            Rectangle{
                                width: 1
                                height: 100
                                color: "#5cb1ff"
                            }
                        }
                    }
                    ColumnLayout{
                        Layout.fillWidth: true
                        spacing: 5
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            font.pixelSize: 24
                            color: "white"
                            text: distance(navigationService.currentInstruction.distanceToNextTurn)
                        }
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            color: "white"
                            Layout.fillWidth: true
                            font.pixelSize: 18
                            text: navigationService.currentInstruction.nextStreetName
                        }
                    }
                }
            }
            Rectangle{
                z:5
                visible: navigationService.active
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 20
                implicitHeight: 140
                implicitWidth: 500
                radius: 20
                color: "#363640"

                ColumnLayout{
                    spacing: 5
                    anchors.margins: 5
                    anchors.centerIn: parent
                    Layout.fillWidth: true
                    RowLayout{
                        spacing: 50
                        Label {
                            text: navigationService.currentInstruction.nextStreetName
                            Layout.alignment: Qt.AlignLeft
                            font.pixelSize: 24
                            color: "white"
                            font.family: "Montserrat"
                            font.bold: Font.Normal
                        }
                        Item{
                            Layout.fillWidth: true
                        }

                        Label {
                            text: {
                                var currentTime = new Date();
                                var timeToAdd = new Date();

                                // Set the time interval to add (hours, minutes, seconds)
                                timeToAdd.setHours(1);       // 1 hour
                                timeToAdd.setMinutes(30);    // 30 minutes
                                timeToAdd.setSeconds(15);    // 15 seconds

                                // Add the time interval to the current time
                                currentTime.setMilliseconds(currentTime.getMilliseconds() + timeToAdd.getTime());

                                // Format the result to display as HH:mm:ss
                                var hours = currentTime.getHours().toString().padStart(2, "0");
                                var minutes = currentTime.getMinutes().toString().padStart(2, "0");
                                var seconds = currentTime.getSeconds().toString().padStart(2, "0");

                                return hours + ":" + minutes + ":" + seconds;
                            }
                            Layout.alignment: Qt.AlignRight
                            color: "white"
                            font.pixelSize: 18
                            font.family: "Montserrat"
                            font.bold: Font.Normal
                        }
                    }
                    RowLayout{
                        spacing: 50
                        Label {
                            text: distance(navigationService.currentInstruction.traveledDistance)
                            Layout.alignment: Qt.AlignLeft
                            font.pixelSize: 18
                            color: "white"
                            font.family: "Montserrat"
                            font.bold: Font.Normal
                        }
                        Item{
                            Layout.fillWidth: true
                        }

                        Label {
                            text: qsTr("Estimated Arrival")
                            Layout.alignment: Qt.AlignRight
                            color: "white"
                            font.family: "Montserrat"
                            font.bold: Font.Normal
                            font.pixelSize: 18
                        }
                    }
                    RowLayout{
                        spacing: 50
                        Label {
                            Layout.alignment: Qt.AlignLeft
                            font.pixelSize: 18
                            color: "white"
                            font.family: "Montserrat"
                            font.bold: Font.Normal
                            text: distance(navigationService.currentInstruction.remainingTravelDistance)
                        }

                        Slider{
                            from:0
                            to: navigationService.currentInstruction.traveledDistance+ navigationService.currentInstruction.remainingTravelDistance
                            value: navigationService.currentInstruction.traveledDistance
                            Layout.alignment: Qt.AlignHCenter
                            Layout.fillWidth: true
                        }

                        Label {
                            Layout.alignment: Qt.AlignRight
                            color: "white"
                            font.family: "Montserrat"
                            font.bold: Font.Normal
                            font.pixelSize: 18
                            text: convertSecondsToTime(navigationService.currentInstruction.remainingTravelTime) //navigationService.currentInstruction.nextSpeedLimitVariation()
                            function convertSecondsToTime(seconds) {
                                var hours = Math.floor(seconds / 3600);
                                var remainingSeconds = seconds % 3600;
                                var minutes = Math.floor(remainingSeconds / 60);
                                var remainingMinutes = remainingSeconds % 60;

                                var hoursStr = hours < 10 ? "0" + hours : hours;
                                var minutesStr = minutes < 10 ? "0" + minutes : minutes;
                                var secondsStr = remainingMinutes < 10 ? "0" + remainingMinutes : remainingMinutes;
                                return hoursStr + ":" + minutesStr + ":" + secondsStr;
                            }
                        }
                    }
                }
            }
        }
    }

    // Now Add two Points 1 = StartingPoint And 2 = Ending Point
    RoutingService
    {
        id: routingService
        type: Route.Type.Fastest
        transportMode: Route.TransportMode.Car
        waypoints: LandmarkList {
            Landmark {
                name: "Starting Point"
                coordinates: Coordinates {
                    latitude: 35.764252
                    longitude: 10.811289
                }
            }
            Landmark {
                name: "Ending Point"
                coordinates: destinationCoordinates
            }
        }
        onFinished: {
            geomapview.routeCollection.set(routeList)
            geomapview.centerOnRouteList(routeList)
        }
    }
    // Now Let's Add NavigationService For Find The Path or Route And Compute The Data Like Distance And time
    NavigationService
    {
        id:navigationService
        route: geomapview.routeCollection.mainRoute
        simulation: true

        onActiveChanged:
        {
            if (active)
            {
                geomapview.startFollowingPosition()
                geomapview.routeCollection.clear(true)
                geomapview.routeCollection.add(route)
            }
        }
        onWaypointReached: console.log("WaypointReached :" + waypoint.name);
        onDestinationReached: geomapview.routeCollection.clear();
        onNavigationError: {
            geomapview.routeCollection.clear();
        }
        onNavigationRouteUpdated: {
            geomapview.routeCollection.add(route, true);
            geomapview.routeCollection.clear(true);
        }
    }
    function createMarkerPoi(lat, lon)//regular markers - can be grouped;
    {
        let coords = ServicesManager.createCoordinates(lat,lon,0);//lat,lon,alt
        let marker = ServicesManager.createMarker();
        marker.append(coords);
        {
            let lmk = ServicesManager.createLandmark(routingWaypoints);
            lmk.coordinates = coords;
            routingWaypoints.append(lmk);
        }
        return marker;
    }

    LandmarkList {
        id: routingWaypoints
    }
    Timer {
        id: searchTimer
        interval: 500
        onTriggered: {
            searchService.searchNow();
        }
    }
    SearchService {
        id: searchService
        filter: searchBar.text
        searchMapPOIs: true
        searchAddresses: true
        limit: 10

        function searchNow() {
            searchTimer.stop();
            cancel();
            referencePoint = geomapview.cursorWgsPosition();
            search();
        }

    }
    ColumnLayout {
        z: 2
        spacing: 20
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter

        Rectangle{
            id:zoomInOut
            implicitHeight: 130
            implicitWidth: 55
            radius: 16
            Rectangle{
                z:2
                width: zoomInOut.width - 15
                color: "grey"
                height: 1
                anchors.centerIn: parent
            }

            ColumnLayout{
                z:1
                anchors.centerIn: parent
                spacing: 20
                Rectangle {
                    implicitHeight: 50
                    implicitWidth: 50
                    radius: 20
                    color: "#FFFFFF"
                    Image{
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        anchors.centerIn: parent
                        source: "qrc:/assets/image/plus.png"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                geomapview.zoomIn()
                            }
                        }
                    }
                }
                Rectangle {
                    implicitHeight: 50
                    implicitWidth: 50
                    radius: 20
                    color: "#FFFFFF"
                    Image{
                        width: parent.width * 0.5
                        height: parent.height * 0.5
                        source: "qrc:/assets/image/moins.png"
                        anchors.centerIn: parent
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                geomapview.zoomOut()
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            implicitHeight: 50
            implicitWidth: 50
            radius: 20
            color: "#FFFFFF"
            Image {
                source: "qrc:/assets/image/navigation.png"
                width: parent.width * 0.5
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        navigationService.active = !navigationService.active
                    }
                }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            implicitHeight: 50
            implicitWidth: 50
            radius: 20
            color: "#FFFFFF"
            Image {
                id: location
                source: "qrc:/assets/image/location.png"
                width: parent.width * 0.5
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        geomapview.centerOnCoordinates(startCoordinates, -1);
                        if (geomapview.markerCollection.listCount>0)
                        {
                            routingWaypoints.clear();
                            geomapview.markerCollection.removeList(0);//markers
                            geomapview.update();
                        }
                        else
                        {
                            //regular markers - can be grouped;
                            let markerlist = ServicesManager.createMarkerList(MarkerList.Type.Point);
                            let markerListRenderSettings = ServicesManager.createMarkerListRenderSettings();
                            markerListRenderSettings.imageSize = 32;
                            markerListRenderSettings.icon = ServicesManager.createIconFromFile("assets/violetcircle.png");
                            markerListRenderSettings.labelingMode = MarkerRenderSettings.Group;
                            markerListRenderSettings.pointsGroupingZoomLevel = 90;
                            markerListRenderSettings.lowDensityPointsGroupMaxCount = 6;
                            markerListRenderSettings.lowDensityPointsGroupIcon = ServicesManager.createIconFromFile("assets/redcircle.png");
                            markerListRenderSettings.mediumDensityPointsGroupMaxCount = 9;
                            markerListRenderSettings.mediumDensityPointsGroupIcon = ServicesManager.createIconFromFile("assets/greensquare.png");
                            markerListRenderSettings.highDensityPointsGroupMaxCount = 12;
                            markerListRenderSettings.highDensityPointsGroupIcon = ServicesManager.createIconFromFile("assetsbluetriangle.png");

                            console.log(markerListRenderSettings);


                            //map.stylePath = "qrc:/Basic_1_Night_Blues_with_Elevation-1_5_688.style";
                            // map.stylePath = "qrc:/Basic_1_Oldtime_with_Elevation-1_12_657.style";
                            routingWaypoints.clear();
                            markerlist.append(createMarkerPoi(36.8981374829, 10.1882752467));//lat,lon
                            geomapview.markerCollection.appendList(markerlist, markerListRenderSettings);
                            console.log("marker collection len:"+geomapview.markerCollection.listCount);
                            console.log("markerlist len:"+markerlist.length);
                            {
                                geomapview.centerOnGeographicArea(routingWaypoints.boundingBox)
                            }
                        }
                    }
                }
                anchors.centerIn: parent
            }
        }
        Rectangle {
            implicitHeight: 50
            implicitWidth: 50
            radius: 20
            color: "#FFFFFF"
            Image {
                id: path
                source: "qrc:/assets/image/path.png"
                width: parent.width * 0.5
                height: parent.height * 0.5
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    enabled: ServicesManager.settings.connected && !navigationService.active && destinationCoordinates !== null
                    onClicked: {
                        if (destinationCoordinates !== null) {
                            routingService.update(); // Mise à jour du service de routage
                        } else {
                            console.log("Destination coordinates are null.");
                        }
                    }
                }
                anchors.centerIn: parent
            }
        }
    }
}
