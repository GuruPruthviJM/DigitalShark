import QtQuick 2.15
Item {
    id: rootid
    property alias  buttonText: displayid.text
     property alias buttonvisi:abc.visible
    signal buttonClicked()
    width:abc.width
    height:abc.height
    property bool  isvisible: true
    Rectangle {

        id:abc
        color:"red"
        width:abcd.width/8+displayid.width
        height:abcd.width/8+displayid.height
        x:10;y:10
        enabled: isvisible
        Text{
            id:displayid
            anchors.centerIn: parent
            anchors.rightMargin: 10
            text:"button"
            font.pointSize: 20
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
                rootid.buttonClicked()

            }

        }
    }

}
