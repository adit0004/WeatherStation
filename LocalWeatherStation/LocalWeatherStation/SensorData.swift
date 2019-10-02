//
//  SensorData.swift
//  LocalWeatherStation
//
//  Created by Prashant Singh on 2/10/19.
//  Copyright © 2019 Aditya Kumar. All rights reserved.
//

import UIKit

class SensorData: NSObject {
    
    var timeStamp: String
    var airPressure: Double
    var temperature: Double
    var red: Int
    var green: Int
    var blue: Int
    var light: Int

    
    init(timeStamp: String, airPressure: Double, temperature: Double, red: Int, green: Int, blue: Int, light: Int){
        self.timeStamp = timeStamp
        self.airPressure = airPressure
        self.temperature = temperature
        self.red = red
        self.green = green
        self.blue = blue
        self.light = light
    }
    
}
