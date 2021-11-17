//
//  WindInfo.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 16.11.2021.
//

import UIKit

class WindInfo {
    var windSpeed: Double
    var windDirection: Int
    
    init(windSpeed: Double, windDirection: Int) {
        self.windSpeed = windSpeed
        self.windDirection = windDirection
    }
}
