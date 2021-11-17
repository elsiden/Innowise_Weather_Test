//
//  ListOfWeather.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 16.11.2021.
//

import UIKit

class ListOfWeather {
    var time: Date
    var weatherDescription: WeatherDescription
    var weatherType: WeatherType
    var windInfo: WindInfo
    
    init(time: Date, weatherDescription: WeatherDescription,
         weatherType: WeatherType, windInfo: WindInfo) {
        self.time = time
        self.weatherDescription = weatherDescription
        self.weatherType = weatherType
        self.windInfo = windInfo
    }
}
