/**
 * Copyright (c) 2012 Nokia Corporation.
 */

// Visual style for MeeGo
import QtQuick 1.1

QtObject {
    // This should be bound from outside (to Window's inPortrait property).
    // The screen orientation will affect how the margins etc. are defined.
    property bool inPortrait: true

    // E6 has different screen resolution & aspect ratio (640x480), thus
    // there's some differentation for it separately.
    property bool isE6: false

    // Property, that holds the currently set volume level.
    property double currentVolume: 0

    // General
    property int margins: 4

    // Font properties
    property int smallFontSize: 15
    property int generalFontSize: 20
    property int largeFontSize: 30
    property int extraLargeFontSize: smallFontSize * 2
    property int ultraLargeFontSize: largeFontSize * 2
    property string defaultFontFamily: "Helvetica"  // Defaults to correct ones in device
    property color defaultFontColor: "#FFFFFF"

    // PlayerView section
    property int controlMargins: 10
    property int controlWidth: isE6 ? 70 : 50
    property int controlHeight: isE6 ? 70 : 50
    property int controlAreaHeight: isE6 ? 85 : 65
    property double controlOpacity: 0.8
    property int separatorWidth: 1
    property color separatorColor: "#303030"

    // Busy indicator
    property int busyIndicatorHeight: inPortrait ? screen.displayWidth / 4
                                                 : screen.displayHeight / 4
    property int busyIndicatorWidth: busyIndicatorHeight

    // Video information
    property int informationViewMargins: 5

    // VideoPlayView definitions. Used to define the size of the margins around
    // the Video Element when not in fullscreen.
    property double topAreaProportion: inPortrait ? 0.27 : 0.09
    property double bottomAreaProportion: inPortrait ? 0.37 : 0.24
    property double leftAreaProportion: inPortrait ? 0.00 : 0.05
    property double rightAreaProportion: inPortrait ? 0.00 : 0.31

    // Transition animation durations (in milliseconds)
    property int animationDurationShort: 150
    property int animationDurationNormal: 350
    property int animationDurationPrettyLong: 500
    property int animationDurationLong: 600

    // Hideout time after which the videoplayer controls should be hidden.
    property int videoControlsHideTimeout: 5000
}
