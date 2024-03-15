import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: windowId.width * 0.08
    height: windowId.height * 0.05
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.topMargin: parent.height * 0.01
    anchors.rightMargin: parent.width * 0.05
    property bool darkMode: false

    Rectangle {
        id: toggleRectID
        width: parent.width
        height: parent.height
        radius: parent.width * 0.25
        color: darkMode ? "#ffffff" : "#000000"
        border.color: darkMode ? "black" : "#dcdcdc"
        // border.width: 15
    }

    Rectangle {
        id: toggleCircleId
        width: parent.width * 0.5
        height: parent.height
        radius: toggleCircleId.width * 0.5
        border.width: parent.width * 0.02
        Behavior on x {
            NumberAnimation {
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                toggleCircleId.x = toggleCircleId.x === 0 ? toggleRectID.width - toggleCircleId.width : 0;
                darkMode = !darkMode;
                toggled(darkMode);
            }
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            toggleCircleId.x = toggleCircleId.x === 0 ? toggleRectID.width - toggleCircleId.width : 0;
            windowId.color=(windowId.color=="#dcdcdc")?"black":"#dcdcdc"
            darkMode = !darkMode;
            colorChange();
        }
    }
    signal colorChange()
}
