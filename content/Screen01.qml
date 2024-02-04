

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtCore
import QtQuick 6.2
import QtQuick.Controls 6.2
import QtQuick.Dialogs 6.2
import sciton_qml_pinpad
import jeremy 1.0
Rectangle {
    id: rectangle
    width: 800
    height: 640

    color: Constants.backgroundColor

    FileDialog {
        id: passwordFileDialog
        onAccepted: backend.passwordFileName = passwordFileDialog.selectedFile
    }

    Button {
        id: b_4
        text: qsTr("4")
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 70
        anchors.horizontalCenterOffset: -78
        checkable: true
        anchors.horizontalCenter: parent.horizontalCenter

        Connections {
            target: b_4
            onClicked: backend.digitClicked("4")
        }
    }

    Button {
        id: b_5
        x: -5
        y: -5
        text: qsTr("5")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_5
            onClicked: backend.digitClicked("5")
        }
        checkable: true
        anchors.verticalCenterOffset: 70
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_6
        x: 6
        y: 6
        text: qsTr("6")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_6
            onClicked: backend.digitClicked("6")
        }
        checkable: true
        anchors.verticalCenterOffset: 70
        anchors.horizontalCenterOffset: 84
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_7
        x: 3
        y: 3
        text: qsTr("7")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_7
            onClicked: backend.digitClicked("7")
        }
        checkable: true
        anchors.verticalCenterOffset: 128
        anchors.horizontalCenterOffset: -78
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_8
        x: -2
        y: -2
        text: qsTr("8")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_8
            onClicked: backend.digitClicked("8")
        }
        checkable: true
        anchors.verticalCenterOffset: 128
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_9
        x: 9
        y: 9
        text: qsTr("9")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_9
            onClicked: backend.digitClicked("9")
        }
        checkable: true
        anchors.verticalCenterOffset: 128
        anchors.horizontalCenterOffset: 84
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_1
        x: -6
        y: -6
        text: qsTr("1")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_1
            onClicked: backend.digitClicked("1")
        }
        checkable: true
        anchors.verticalCenterOffset: 12
        anchors.horizontalCenterOffset: -78
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_2
        x: -11
        y: -11
        text: qsTr("2")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_2
            onClicked: backend.digitClicked("2")
        }
        checkable: true
        anchors.verticalCenterOffset: 12
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_3
        x: 0
        y: 0
        text: qsTr("3")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_3
            onClicked: backend.digitClicked("3")
        }
        checkable: true
        anchors.verticalCenterOffset: 12
        anchors.horizontalCenterOffset: 84
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_clear
        x: -3
        y: -3
        text: qsTr("Clear")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_clear
            onClicked: backend.clearClicked()
        }
        checkable: true
        anchors.verticalCenterOffset: 186
        anchors.horizontalCenterOffset: -78
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_enter
        x: 9
        y: 9
        text: qsTr("Enter")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_enter
            onClicked: backend.enterClicked()
        }
        checkable: true
        anchors.verticalCenterOffset: 186
        anchors.horizontalCenterOffset: 92
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: b_0
        x: 5
        y: 5
        text: qsTr("0")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_0
            onClicked: backend.digitClicked("0")
        }
        checkable: true
        anchors.verticalCenterOffset: 186
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text1
        x: 947
        y: 330
        text: qsTr("Please Enter Password")
        font.pixelSize: 12
    }

    Button {
        id: b_openPassFile
        x: -4
        y: -4
        text: qsTr("Open Password File")
        anchors.verticalCenter: parent.verticalCenter
        Connections {
            target: b_openPassFile
            onClicked: passwordFileDialog.open()
        }
        checkable: true
        anchors.verticalCenterOffset: 294
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: image
        x: 316
        y: 8
        width: 200
        height: 200
        source: "qrc:/qtquickplugin/images/template_image.png"
        fillMode: Image.PreserveAspectFit
    }

    TextInput {
        id: textInput
        x: 377
        y: 259
        width: 80
        height: 20
        font.pixelSize: 12
        text: backend.password
    }

    Text {
        id: text2
        x: 358
        y: 227
        text: qsTr("Please Enter Password")
        font.pixelSize: 12
    }



}
