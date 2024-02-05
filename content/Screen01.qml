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
import QtQuick.Layouts
import sciton_qml_pinpad

Rectangle {
    id: rectangle
    width: 800
    height: 640

    color: Constants.backgroundColor

    FileDialog {
        id: passwordFileDialog
        onAccepted: backend.passwordFileName = passwordFileDialog.selectedFile
    }

    Text {
        id: enterPasswordLabel
        anchors {
            top: logoImage.bottom
            horizontalCenter: textInput.horizontalCenter
        }

        text: qsTr("Please Enter Password")
        anchors.topMargin: 6
        font.pixelSize: 12
        anchors.horizontalCenterOffset: 0
    }
    // FIXME: load correct Logo Image
    Image {
        id: logoImage
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -200
        anchors.horizontalCenterOffset: 0
        width: 200
        height: 200
        source: "img/logo200px.png"

        fillMode: Image.PreserveAspectFit
    }

    TextInput {
        id: textInput
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: -62
        anchors.horizontalCenterOffset: 0
        width: 80
        height: 20
        text: backend.password
        font.pixelSize: 12
        inputMethodHints: Qt.ImhHiddenText
        echoMode: TextInput.Password
        passwordCharacter: "*"
    }

    GridLayout {
        id: gridLayout
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 65
        height: 200
        width: 200

        Button {
                id: b_1
                width: 64
                height: 64
                Layout.column: 1
                Layout.row: 1
                text: qsTr("1")
                antialiasing: true
                Connections {
                    target: b_1
                    onClicked: backend.digitClicked("1")
                }
                checkable: false
        }

        Button {
            id: b_2
            height: 64
            width: 64
            Layout.column: 2
            Layout.row: 1
            text: qsTr("2")
            antialiasing: true
            Connections {
                target: b_2
                onClicked: backend.digitClicked("2")
            }
            checkable: false

        }

        Button {
            id: b_3
            height: 64
            width: 64
            Layout.column: 3
            Layout.row: 1
            text: qsTr("3")
            antialiasing: true
            Connections {
                target: b_3
                onClicked: backend.digitClicked("3")
            }
            checkable: false
        }

        Button {
            id: b_4
            height: 64
            width: 64
            Layout.column: 1
            Layout.row: 2
            text: qsTr("4")
            antialiasing: true
            checkable: false

            Connections {
                target: b_4
                onClicked: backend.digitClicked("4")
            }
        }

        Button {
            id: b_5
            height: 64
            width: 64
            Layout.column: 2
            Layout.row: 2
            text: qsTr("5")
            antialiasing: true
            Connections {
                target: b_5
                onClicked: backend.digitClicked("5")
            }
            checkable: false
        }

        Button {
            id: b_6
            height: 64
            width: 64
            Layout.column: 3
            Layout.row: 2
            text: qsTr("6")
            antialiasing: true
            Connections {
                target: b_6
                onClicked: backend.digitClicked("6")
            }
            checkable: false
        }

        Button {
            id: b_7
            height: 64
            width: 64
            Layout.column: 1
            Layout.row: 3
            text: qsTr("7")
            antialiasing: true
            Connections {
                target: b_7
                onClicked: backend.digitClicked("7")
            }
            checkable: false
        }

        Button {
            id: b_8
            height: 64
            width: 64
            Layout.column: 2
            Layout.row: 3
            text: qsTr("8")
            antialiasing: true
            Connections {
                target: b_8
                onClicked: backend.digitClicked("8")
            }
            checkable: false
        }

        Button {
            id: b_9
            height: 64
            width: 64
            Layout.column: 3
            Layout.row: 3
            text: qsTr("9")
            antialiasing: true
            Connections {
                target: b_9
                onClicked: backend.digitClicked("9")
            }
            checkable: false
        }

        Button {
            id: b_0
            height: 64
            width: 64
            Layout.column: 2
            Layout.row: 4
            text: qsTr("0")
            antialiasing: true
            Connections {
                target: b_0
                onClicked: backend.digitClicked("0")
            }
            checkable: false
        }
    }

    Button {
        id: b_clear
        anchors.verticalCenter: gridLayout.verticalCenter
        anchors.horizontalCenter: gridLayout.horizontalCenter
        Layout.column: 1
        Layout.row: 4
        text: qsTr("Clear")
        anchors.verticalCenterOffset: 97
        anchors.horizontalCenterOffset: -88
        antialiasing: true
        Connections {
            target: b_clear
            onClicked: backend.clearClicked()
        }
        checkable: false
    }

    Button {
        Layout.column: 3
        Layout.row: 4
        id: b_enter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 161
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 90
        text: qsTr("Enter")
        antialiasing: true
        Connections {
            target: b_enter
            onClicked: backend.enterClicked()
        }
        checkable: false

    }

    Button {
        id: b_openPassFile
        text: qsTr("Open Password File")
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 277
        anchors.horizontalCenter: parent.horizontalCenter
        antialiasing: true
        Connections {
            target: b_openPassFile
            onClicked: passwordFileDialog.open()
        }
        checkable: false

    }


}
