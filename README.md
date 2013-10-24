Custom QML Video Player
=======================

The Custom QML Video Player provides a reusable QML component for playing
video and showing transparent overlay controls on top of video content.
The VideoPlayer component enables showing full-screen videos with play
controls that can be hidden or in a smaller size with play controls and other
information always shown. The controls can be easily modified with QML code.

The VideoPlayer has been created mostly with custom QML code, but it does use
the Qt Quick Components (such as Button, ProgressBar, BusyIndicator) in a few
places. For example, the ProgressBar is used to indicate the current playback
position in a way that is familiar to the user.

This example component demonstrates:
- QML video playing capabilities
- Customised overlay controls on top of video content
- Handling Symbian phone volume keys within the QML code
- Reacting to the phone's current profile changes

This example component is hosted in Nokia Developer Projects:
- http://projects.developer.nokia.com/videoplayer

For more information on the implementation, visit the wiki page:
- http://projects.developer.nokia.com/videoplayer/wiki


1. Usage
-------------------------------------------------------------------------------

The customised QML VideoPlayer component can be used in applications simply by
adding the VideoPlayer QML sources into the project and importing it into
a QML file. The player itself can be created by instantiating the VideoPlayView
and by calling its setVideoData() function.

If the hardware volume keys are required, the volumekeys.h has to be included
in a .cpp file (e.g., the application's main.cpp) and the VolumeKeys class
should be instantiated and passed to the declarative context by calling the
QDeclarativeContext::setContextProperty. By default, the volume keys' context 
property is assumed to be named as "volumeKeys".


2. Prerequisites
-------------------------------------------------------------------------------

 - Qt basics
 - Qt Quick basics
 - Qt Quick Components basics


3. Project structure and implementation
-------------------------------------------------------------------------------

3.1 Folders
-----------

 |                   The root folder contains the licence information and
 |                   this file (release notes).
 |
 |- meego            
 |  |
 |  |- VideoPlayer   MeeGo platform-specific code files.
 |
 |- symbian          
 |  |
 |  |- VideoPlayer   Symbian (Anna/Belle) platform-specific code files.
 |


3.2 Important files and classes
-------------------------------

| Class                   | Description                                       |
|-------------------------|---------------------------------------------------|
| VolumeKeys              | Class that implements the MRemConCoreApiTarget-   |
|                         | Observer for reacting to hardware volume buttons. |
|-------------------------|---------------------------------------------------|


3.3 Used APIs/QML elements/Qt Quick Components
----------------------------------------------

The following APIs, QML elements, and Qt Quick Components have been used. 

Symbian & Qt: (Used only in Symbian with the VolumeKeys implementation)
- CRemConCoreApiTarget
- CRemConInterfaceSelector
- MRemConCoreApiTargetObserver
- QObject

Standard QML elements:
- Connections
- Loader
- State
- Text
- Timer
- Transition

QML elements from Qt Quick Components:
- BusyIndicator
- ProgressBar
- Slider

QML elements from Qt Mobility:
- DeviceInfo
- Video


4. Compatibility
-------------------------------------------------------------------------------

Compatible with:
 - Symbian devices with Qt 4.7.4 or higher.
 - MeeGo 1.2 Harmattan devices.

Tested on:
 - Nokia E6
 - Nokia E7-00
 - Nokia N9

Developed with:
 - Qt SDK 1.2


4.1 Required capabilities
-------------------------

None; The application can be self signed on Symbian.


4.2 Known issues and design limitations
---------------------------------------

- If you use the Custom VideoPlayer Component for streaming videos over the
internet, streaming might not start on some device & operator combinations.
This might be due to the used video streaming access point. Changing it may help.
In Symbian devices, select
"Menu" - "Settings" - "Application settings" - "Videos" - "Access point in use"
to change the currently used streaming access point.

After video playback there are severe performance bugs.
- https://bugreports.qt.nokia.com/browse/QTMOBILITY-1570 & -1818

Swiping the application to the background on the Nokia N9 while the video is
playing causes the application to crash.
- https://bugreports.qt-project.org/browse/QTMOBILITY-1995


5. Building, installing, and running the application
-------------------------------------------------------------------------------

5.1 Preparations
----------------

Check that you have the latest Qt SDK installed in the development environment
and the latest Qt version on the device.

Qt Quick Components 1.1 or higher is required.

Copy the VideoPlayer QML folder (and the volumekeys source files, if needed) to
the project's own QML source folder, and create the model with the m_contentUrl
for the VideoPlayView QML Element. Call the setVideoData() function to start
the playback.

5.2 Using the Qt SDK
--------------------

You can install and run the application on the device by using the Qt SDK.
Open the project in the SDK, set up the correct target (depending on the device
platform), and click the Run button. For more details about this approach,
visit the Qt Getting Started section at Nokia Developer
(http://www.developer.nokia.com/Develop/Qt/Getting_started/).

5.3 Symbian device
------------------

Make sure your device is connected to your computer. Locate the .sis
installation file and open it with Nokia Suite. Accept all requests from Nokia
Suite and the device. Note that you can also install the application by copying
the installation file onto your device and opening it with the Symbian File
Manager application.

After the application is installed, locate the application icon from the
application menu and launch the application by tapping the icon.

5.4 Nokia N9 and Nokia N950
---------------------------

Copy the application Debian package onto the device. Locate the file with the
device and run it; this will install the application. Note that you can also
use the terminal application and install the application by typing the command
'dpkg -i <package name>.deb' on the command line. To install the application
using the terminal application, make sure you have the right privileges 
to do so (e.g. root access).

Once the application is installed, locate the application icon from the
application menu and launch the application by tapping the icon.


6. Licence
-------------------------------------------------------------------------------

See the licence text file delivered with this project. The licence file is also
available online at
https://projects.developer.nokia.com/videoplayer/browser/Licence.txt


7. Related documentation
-------------------------------------------------------------------------------
Qt Quick Components
- http://doc.qt.nokia.com/qt-components-symbian-1.0/index.html
- http://harmattan-dev.nokia.com/docs/library/html/qt-components/qt-components.html


8. Version history
-------------------------------------------------------------------------------

1.0 Published on the Nokia Developer website.
