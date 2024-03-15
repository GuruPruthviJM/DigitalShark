import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4

Window {
    id:windowId
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black"

    Circularguage{
        id:circularId
        onGauge: {
            gaugeId.open()
        }
    }
    Guge{
        id: gaugeId
        onCircularGauge: {
            circularId.open()
        }
    }
}
