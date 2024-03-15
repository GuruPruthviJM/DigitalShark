import QtQuick 2.15

Item {
    property alias bname: mtext.text
    width: mrect.width
    height: mrect.height
    Rectangle{
        id: mrect
        width: mtext.implicitWidth + parent.width *0.7 + 5
        height: mtext.implicitHeight + parent.width *0.6 + 5
        Text {
            id: mtext
            text: "Button"
            anchors.centerIn: parent
        }
        border.width: 2
        color: "magenta"
    }
}
