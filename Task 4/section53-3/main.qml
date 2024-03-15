import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"
    Rectangle {
        id: rectId
        anchors.centerIn: parent
        width: parent.width * 0.25
        height: parent.height * 0.25
        border.color: "white"
        border.width: 8
        color: "greenyellow"
        focus: true
        Keys.onPressed: {
            if (event.text === "a") {
                rectId.color = "red"
            } else if (event.text === "b") {
                rectId.color = "yellow"
            } else if (event.text === "c") {
                rectId.color = "green"
            } else if (event.text === "d") {
                rectId.color = "blue"
            } else if (event.text === "A") {
                rectId.color = "pink"
            } else if (event.text === "B") {
                rectId.color = "orange"
            } else if (event.text === "C") {
                rectId.color = "brown"
            } else if (event.text === "D") {
                rectId.color = "black"
            }
        }
    }
}
