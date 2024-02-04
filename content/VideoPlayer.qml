import QtQuick 2.15
import QtQuick.Controls 2.15
import sciton_qml_pinpad 1.0
import QtQuick.Dialogs
import QtMultimedia
import jeremy

Rectangle {
    // Not really needed but I understand the importance of aliasing for managing complex projects
    property alias videoSource: video.source
    width: 800
    height: 640

    FileDialog {
        id: videoFileDialog
        onAccepted: {
            videoSource = videoFileDialog.selectedFile
        }
    }

    Video {
        id: video
        x: 78
        y: 109
        // nHD 16:9 resolution
        width: 640
        height: 360
        loops: MediaPlayer.Infinite
        volume: volumeSlider.value

        MouseArea {
            anchors.fill: parent
            onClicked: video.play()
        }
        focus: true
        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
        Keys.onLeftPressed: video.position = video.position - 1000
        Keys.onRightPressed: video.position = video.position + 1000
    }

    Button {
        id: playButton
        x: 150
        y: 550
        text: video.playbackState == MediaPlayer.PlayingState ? qsTr("Pause") : qsTr("Play")
        onClicked: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
    }

    Button {
        id: stopButton
        x: 300
        y: 550
        text: qsTr("Stop")
        onClicked: video.stop()
    }

    Button {
        id: loadVideoButton
        x: 450
        y: 550
        text: qsTr("Load Video")
        onClicked: videoFileDialog.open()
    }

    Slider {
        id: volumeSlider
        anchors {
            top: video.bottom
            left: loadVideoButton.left
        }

        value: 0.0

        Text {
            id: volumeText
            x: 80
            y: 45
            text: qsTr("Volume")
            font.pixelSize: 12
        }
    }

    Text {
        id: text2
        x: 296
        y: 30
        text: qsTr("Welcome (back) to Jeremys QML World")
        font.pixelSize: 12
    }
}
