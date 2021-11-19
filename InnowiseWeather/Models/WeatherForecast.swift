//
//  WeatherForecast.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 16.11.2021.
//

import UIKit

class WeatherForecast {
    var time: String
    var day: String
    var currentTemperature: Double
    var weatherType: WeatherType
    
    init(time: String, day: String,
         currentTemperature: Double, weatherType: WeatherType) {
        self.time = time
        self.day = day
        self.currentTemperature = currentTemperature
        self.weatherType = weatherType
    }
}
