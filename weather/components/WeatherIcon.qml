import QtQuick 2.0

Item {
    id: container

    property string weatherIcon: "01d"

    //server icons are too small. we keep using the local images
    property bool useServerIcon: true

    Image {
        id: img
        source: {
            if (useServerIcon)
                "http://openweathermap.org/img/w/" + container.weatherIcon + ".png"
            else {
                switch (weatherIcon) {
                case "01d":
                case "01n":
                     "../icon/weather-sunny.png"
                    break;
                case "02d":
                case "02n":
                    "../icon/weather-sunny-very-few-clouds.png"
                    break;
                case "03d":
                case "03n":
                    "../icon/weather-few-clouds.png"
                    break;
                case "04d":
                case "04n":
                    "../icon/weather-overcast.png"
                    break;
                case "09d":
                case "09n":
                    "../icon/weather-showers.png"
                    break;
                case "10d":
                case "10n":
                    "../icon/weather-showers.png"
                    break;
                case "11d":
                case "11n":
                    "../icon/weather-thundershower.png"
                    break;
                case "13d":
                case "13n":
                    "../icon/weather-snow.png"
                    break;
                case "50d":
                case "50n":
                    "../icon/weather-fog.png"
                    break;
                default:
                    "../icon/weather-unknown.png"
                }
            }
        }
        smooth: true
        anchors.fill: parent
    }
}
