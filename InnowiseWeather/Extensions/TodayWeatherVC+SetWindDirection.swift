//
//  TodayWeatherVC+SetWindDirection.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 17.11.2021.
//

import UIKit

extension TodayWeatherVC {
    func setWindDirection(where windDirection: Int) -> String{
        var direction: String = ""
        if windDirection >= 0 && windDirection <= 23 ||
        windDirection >= 339 && windDirection <= 360 {
            direction = "N"
        } else if windDirection >= 24 && windDirection <= 68 {
            direction = "NE"
        } else if windDirection >= 69 && windDirection <= 113 {
            direction = "E"
        } else if windDirection >= 114 && windDirection <= 158 {
            direction = "SE"
        } else if windDirection >= 159 && windDirection <= 203 {
            direction = "S"
        } else if windDirection >= 204 && windDirection <= 248 {
            direction = "SW"
        } else if windDirection >= 249 && windDirection <= 293 {
            direction = "W"
        } else if windDirection >= 294 && windDirection <= 338 {
            direction = "NW"
        }
        return direction
    }
}
