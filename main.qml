import QtQuick
import QtQuick.Controls

import QtSensors

import org.qfield
import org.qgis
import Theme


Item {
  id: plugin

  property var mainWindow: iface.mainWindow()
  property var positionSource: iface.findItemByObjectName('positionSource')

  Component.onCompleted: {
    iface.addItemToPluginsToolbar(pluginButton)
  }
  

  QfToolButton {
  id: pluginButton
      iconSource: 'Compass_icon.svg'
      iconColor: Theme.mainColor
      bgcolor: Theme.darkGray
      round: true
      onClicked: {
           mainWindow.displayToast(qsTr('Click!'))
       }
   }

// For testing
  // Button {
  //     id: button
  //     x: 516
  //     y: 68
  //     text: qsTr("Button")

  //     onClicked: {
  //         compass.source = "brunton.qml"
  //     }
  // }

  Brunton {
      id: compass
      trend: 25
      parent: mainWindow
  }


}

// 
// ExpressionContextUtils.setProjectVariable(qgisProject, 'key', 'value')
// ExpressionContextUtils.setGlobalVariable('key', 'value') 
