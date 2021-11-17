//
//  WeatherDescription.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 15.11.2021.
//

import UIKit

class WeatherDescription {
    var currentTemperature: Double
    var feelsTemperature: Double
    var humidity: Int
    var pressure: Int
    
    init(currentTemperature: Double, feelsTemperature: Double,
         humidity: Int, pressure: Int) {
        self.currentTemperature = currentTemperature
        self.feelsTemperature = feelsTemperature
        self.humidity = humidity
        self.pressure = pressure
    }
    
}
