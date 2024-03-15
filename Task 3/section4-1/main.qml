import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("section4-1")
    Rect{
        Component.onCompleted: {
            notify.connect(reciveinfo)
        }
    }
}
