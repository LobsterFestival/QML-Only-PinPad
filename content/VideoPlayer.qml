import QtQuick 2.15
import QtQuick.Controls 2.15
import sciton_qml_pinpad 1.0
import QtQuick.Dialogs
import QtMultimedia


Rectangle {
    // Not really needed but I understand the importance of aliasing for managing complex projects
    property alias videoSource: video.source
    width: 800
    height: 640

    Row {
        id: row
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenterOffset: 250
        spacing: 64
        width: 400
        height: 64

        Button {
            id: playButton
            text: video.playbackState == MediaPlayer.PlayingState ? qsTr("Pause") : qsTr("Play")
            onClicked: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        }

        Button {
            id: stopButton
            text: qsTr("Stop")
            onClicked: video.stop()
        }

        Button {
            id: loadVideoButton
            text: qsTr("Load Video")
            onClicked: videoFileDialog.open()
        }
    }

    FileDialog {
        id: videoFileDialog
        onAccepted: {
            videoSource = videoFileDialog.selectedFile
        }
    }

    Video {
        id: video
        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

        // nHD 16:9 resolution
        width: 640
        height: 360
        loops: MediaPlayer.Infinite
        volume: volumeSlider.value
        MouseArea {
            anchors.fill: parent
            onClicked: {
                video.focus = true
                video.play()
            }
        }
        // Seek keys when video is in focus
        Keys.onLeftPressed: video.position = video.position - 3000
        Keys.onRightPressed: video.position = video.position + 3000
    }



    Slider {
        id: volumeSlider
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 350
        value: 0.0
        rotation: 270

        Text {
            id: volumeLabel
            x: 187
            y: 20
            rotation: 90
            text: qsTr("Volume")
            font.pixelSize: 12
        }
    }

    Text {
        id: text2
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -250
        text: qsTr("Welcome (back) to Jeremys QML World")
        font.pixelSize: 19
    }
}
