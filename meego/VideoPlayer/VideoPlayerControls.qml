/**
 * Copyright (c) 2012 Nokia Corporation.
 */

import QtQuick 1.1
import com.nokia.meego 1.0
import "util.js" as Util

Item {
    id: videoPlayerControls

    property bool isPlaying: true
    property int timePlayed: 0
    property int timeDuration: 0
    property bool showBackground: true
    property bool showBackButton: true

    // Property used to indicate scrubbed position. Calculated directly to
    // milliseconds (from the given timeDuration property).
    property int playbackPosition: 0
    property bool enableScrubbing: false

    signal backButtonPressed
    signal playPressed
    signal pausePressed

    Item {
        anchors.fill: parent

        // Use the same background image as the ToolBar.
        BorderImage {
            // Styling for the ToolBar
            property Style tbStyle: ToolBarStyle {}

            id: background
            anchors.fill: parent
            opacity: visual.controlOpacity
            source: videoPlayerControls.showBackground
                    ? tbStyle.background
                    : ""
            border { left: 10; top: 10; right: 10; bottom: 10 }
        }

        Loader {
            id: backButtonLoader

            width: childrenRect.width
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: videoPlayerControls.showBackButton
                                ? visual.controlMargins / 2 : 0
            }
            sourceComponent: videoPlayerControls.showBackButton
                             ? backButtonComponent
                             : undefined
        }

        Component {
            id: backButtonComponent

            Item {
                width: backButton.width + separatorLine.width
                height: videoPlayerControls.height

                ToolIcon {
                    id: backButton

                    platformIconId: "toolbar-back"
                    width: visual.controlWidth
                    height: visual.controlHeight
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: videoPlayerControls.backButtonPressed()
                }
                Rectangle {
                    id: separatorLine

                    y: 1
                    width: visual.separatorWidth
                    height: videoPlayerControls.height
                    color: visual.separatorColor
                    anchors {
                        left: backButton.right
                        leftMargin: visual.controlMargins / 2
                    }
                }
            }
        }

        Button {
            id: playButton

            iconSource: videoPlayerControls.isPlaying
                        ? "image://theme/icon-m-toolbar-mediacontrol-pause-white"
                        : "image://theme/icon-m-toolbar-mediacontrol-play-white"

            opacity: visual.controlOpacity
            width: visual.controlWidth
            height: visual.controlHeight
            anchors {
                verticalCenter: backButtonLoader.verticalCenter
                left: backButtonLoader.right
                leftMargin: visual.controlMargins * 2
            }

            onClicked: {
                if (videoPlayerControls.isPlaying) {
                    videoPlayerControls.pausePressed()
                } else {
                    videoPlayerControls.playPressed()
                }
            }
        }

        VideoInfoTextLabel {
            id: timeElapsedLabel

            text: Util.milliSecondsToString(timePlayed)
            anchors {
                bottom: playButton.verticalCenter
                left: playButton.right
                right: parent.right
                leftMargin: visual.controlMargins
                rightMargin: visual.controlMargins
            }
        }

        VideoInfoTextLabel {
            id: timeDurationLabel

            text: Util.milliSecondsToString(timeDuration)
            anchors {
                bottom: playButton.verticalCenter
                right: parent.right
                rightMargin: visual.controlMargins
            }
        }

        ProgressBar {
            id: progressBar

            anchors {
                top: playButton.verticalCenter
                left: playButton.right
                right: timeDurationLabel.right
                leftMargin: visual.controlMargins
            }

            value: videoPlayerControls.timePlayed /
                   videoPlayerControls.timeDuration
        }

        MouseArea {
            id: progressMA

            enabled: videoPlayerControls.enableScrubbing
            width: progressBar.width
            height: parent.height
            anchors.bottom: parent.bottom
            anchors.left: progressBar.left

            onPositionChanged: {
                var selectedPosition = mouseX < 0 ?
                            0 : mouseX/progressMA.width * videoPlayerControls.timeDuration;
                videoPlayerControls.playbackPosition = selectedPosition;
            }
            onPressed: {
                videoPlayerControls.playbackPosition =
                        mouseX/progressMA.width * videoPlayerControls.timeDuration;
            }
        }
    }
}
