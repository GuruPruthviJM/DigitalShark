import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Item{
    id: gaugeItemId
    width: windowId.width
    height: windowId.height
    property int targetValu: 0
    signal circularGauge()
    visible: false
    function open(){
        gaugeItemId.visible=true
    }

    Gauge {
        width: parent.width*0.2
        height: parent.height*0.6
        minimumValue: 0
        value: targetValu
        maximumValue: 100
        anchors.centerIn: parent
    }
    Rectangle{
        width: parent.width*0.05
        height: parent.height*0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.8
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.47
        color: "white"
        Text {
            id: textId
            anchors.centerIn: parent
            text: targetValu
        }
    }
    Rectangle{
        width: parent.width*0.05
        height: parent.height*0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.8
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.33
        color: "white"
        Text {
            id: addId
            anchors.centerIn: parent
            text: "+"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(targetValu<181)
                    targetValu+=1
            }
        }
    }
    Rectangle{
        width: parent.width*0.05
        height: parent.height*0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.8
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.6
        color: "white"
        Text {
            id: subtractId
            anchors.centerIn: parent
            text: "-"
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(targetValu>0)
                    targetValu-=1
            }
        }
    }
    Rectangle{
        width: parent.width*0.07
        height: parent.height*0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.9
        anchors.left: parent.left
        anchors.leftMargin: parent.width*0.46
        color: "white"
        Text {
            id: submit
            anchors.centerIn: parent
            text: "Next..."
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                circularGauge()
                gaugeItemId.visible=false
            }
        }
    }
}
