import QtQuick
import QtQuick.Controls

import QtSensors

import org.qfield
import org.qgis
import Theme

// NB file:///D:/GitProjects/CompassQML/CompassQML/CompassQML.zip

Item {
  id: plugin

  property var mainWindow: iface.mainWindow()
  property var positionSource: iface.findItemByObjectName('positionSource')

  Component.onCompleted: {
    iface.addItemToPluginsToolbar(pluginButton)
  }
  
  Accelerometer {
        id: accelometer
		active: true
    }
  
  QfToolButton {
    id: pluginButton
    iconSource: 'Compass_icon.svg'
    iconColor: Theme.mainColor
    bgcolor: Theme.darkGray
    round: true
    
    onClicked: {
	
		var acc = accelometer.reading
		// var G = Math.sqrt(acc.x**2 + acc.y**2 + acc.z**2)
		var G = 9.81
		
		var dip = Math.acos(acc.z / G) * 180 / Math.PI
		
		if (isNaN(dip)) {
			dip = 0
		}
		
		var plunge = Math.asin(acc.y / G) * 180 / Math.PI
		
		if (isNaN(plunge)) {
			plunge = 90
		}

		mainWindow.displayToast(qsTr('dip = ' + Math.round(dip) + 
									 '; plunge = ' + Math.round(plunge) ))
    }
  }
}

// 
// ExpressionContextUtils.setProjectVariable(qgisProject, 'key', 'value')
// ExpressionContextUtils.setGlobalVariable('key', 'value') 