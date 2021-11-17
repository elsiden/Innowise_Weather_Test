//
//  WeatherType.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 16.11.2021.
//

import UIKit

class WeatherType {
    var descriptionWeather: String
    var iconWeather: String

    init(descriptionWeather: String, iconWeather: String) {
        self.descriptionWeather = descriptionWeather
        self.iconWeather = iconWeather
    }
}
