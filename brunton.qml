// This emulates a compass/clinometer

import QtQuick
import QtQuick.Controls

import QtSensors

Rectangle{

     property real strike: 0
     property real dip: 0

     property real trend: 0
     property real plunge: 0
     width: 500
     height: 700
     visible: true
     radius: 25
     border.width: 4

     Accelerometer {
           id: accelometer
           active: true

           onReadingChanged: {
               var acc = accelometer.reading
               // var G = Math.sqrt(acc.x**2 + acc.y**2 + acc.z**2)
               var G = 9.81

               dip = Math.acos(acc.z / G) * 180 / Math.PI

               if (isNaN(dip)) {
                   dip = 0
               }

               plunge = Math.asin(acc.y / G) * 180 / Math.PI

               if (isNaN(plunge)) {
                   plunge = 90
               }
           }
       }

     Image {
         id: windrose
         x: 50
         y: 75
         width: 400
         height: 400
         source: "WindRose.svg"
         transformOrigin: Item.Center
         fillMode: Image.PreserveAspectFit

         transform: Rotation {
             origin.x: 100; origin.y: 150
             angle: -trend
         }
     }

     Switch {
         id: planeswitch
         x: 52
         y: 492
         text: qsTr("Plane")
         checked: true
         font.bold: true
          font.pixelSize: 17
     }

     Switch {
         id: lineswitch
         x: 52
         y: 542
         text: qsTr("Line")
         font.bold: true
         font.pixelSize: 17
     }

     Text {
         id: text1
         x: 185
         y: 552
         text: qsTr("Trend: "+Math.round(trend) )
         font.pixelSize: 17
         font.bold: true
     }

     Text {
         id: text2
         x: 278
         y: 552
         text: qsTr("Plunge: "+Math.round(plunge) )
         font.pixelSize: 17
         font.bold: true
     }


     Button {
         id: ok
         x: 174
         y: 603
         text: qsTr("Dismiss")
         font.pixelSize: 24
         highlighted: true
         flat: false

         onClicked: {
             this.destroy()
         }
     }

}
