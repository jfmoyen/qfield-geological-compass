// This emulates a compass/clinometer

import QtQuick
import QtQuick.Controls

import QtSensors

Rectangle {
    id: screen
    width: 150
    height: 150
	
	property real strike: 0
	property real dip: 0
	
	property real trend: 0
	property real plunge: 0
	
	
	}