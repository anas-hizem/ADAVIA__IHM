import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
    color: "#151515"
    Layout.preferredWidth: 400
    Layout.preferredHeight: 150
    radius: 15

    ColumnLayout {
        anchors.centerIn: parent
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: formatTime(new Date())
            font.pixelSize: 36
            font.weight: Font.Bold
            font.family: "Lato"
            color: "#FFFFFF"
        }
        Text {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            text: formatDate(new Date())
            font.pixelSize: 14
            font.weight: Font.Light
            font.family: "Lato"
            color: "#FFFFFF"
        }
    }

    function formatDate(date) {
        var days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var day = days[date.getDay()];
        var month = months[date.getMonth()];
        var dayOfMonth = date.getDate();
        var year = date.getFullYear();
        return day + ", " + month + " " + dayOfMonth + " " + year;
    }

    function formatTime(date) {
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12; // Handle midnight
        minutes = minutes < 10 ? '0' + minutes : minutes;
        return hours + ':' + minutes + ' ' + ampm;
    }
}
