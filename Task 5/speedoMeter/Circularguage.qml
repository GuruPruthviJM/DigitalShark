import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
Item {
    id: circularGaugeItemId
    width: parent.width
    height: parent.height
    property real currentAccelerationValue: 0
    property real targetValu: 0
    function open(){
        circularGaugeItemId.visible=true
    }
    signal gauge()
    CircularGauge {
        id: circularGaugeID
        width: parent.width*0.5
        height: parent.height*0.4
        anchors.centerIn: parent
        value: targetValu
        minimumValue: 0
        maximumValue: 180
        stepSize: 1
        Text {
            text: parent.value
            color: "white"
            anchors.centerIn: parent
        }
        Component.onCompleted: forceActiveFocus()
    }
    Rectangle{
        width: parent.width*0.05
        height: parent.height*0.05
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.7
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
                if(targetValu<101)
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
                gauge()
                circularGaugeItemId.visible=false
            }
        }
    }
}
