// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import QtQuick.Controls
import sciton_qml_pinpad
import jeremy.backend 1.0
Window {
    id: root
    width: 800
    height: 640

    visible: true
    title: "Sciton QML Pin Pad"

    Backend {
        id: backend
        onValidPasswordEntered: mainLoader.source = "VideoPlayer.qml"
    }

    Loader {
        id: mainLoader
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        source: "Screen01.qml"
    }

}


