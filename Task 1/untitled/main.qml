import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Section 1 - P1")
    color: "blue"
    Text {
        id: t1
        anchors.centerIn: parent
        font.bold: true
        font.styleName: "Helvetica"
        font.pixelSize: 20
        text: qsTr("Hello World")
        font.italic: true
    }
    Text {
        id: t2
        text: qsTr("Hello World")
        font.underline: true
    }
}
