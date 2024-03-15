import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rectId
        width: parent.width * 0.25
        height: parent.height * 0.25
        color: "greenyellow"
        focus: true

        Keys.onPressed: {
            if (event !== null) {
                if (event.key === Qt.Key_Right && rectId.x < windowId.width - rectId.width) {
                    rectId.x += windowId.width * 0.05;
                    console.log(rectId.x)
                } else if (event.key === Qt.Key_Left && rectId.x > 0) {
                    rectId.x -= windowId.width * 0.05;
                    console.log(rectId.x)
                } else if (event.key === Qt.Key_Up && rectId.y > 0) {
                    // rectId.y -= windowId.height * 0.05;
                    console.log(rectId.y)
                } else if (event.key === Qt.Key_Down && rectId.y < windowId.height - rectId.height) {
                    // rectId.y += windowId.height * 0.05;
                    console.log(rectId.y)
                }
            }
        }

        onWidthChanged: {
            if (rectId.x > windowId.width - rectId.width) {
                rectId.x = windowId.width - rectId.width;
            }
        }

        onHeightChanged: {
            if (rectId.y > windowId.height - rectId.height) {
                rectId.y = windowId.height - rectId.height;
            }
        }
    }
}
