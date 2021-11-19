//
//  WeatherToday.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 19.11.2021.
//

import UIKit

class WeatherToday {
    var cityName: String
    var countryName: String
    var weatherType: WeatherType
    var currentTemperature: Double
    var feelsTemperature: Double
    var pressure: Int
    var humidity: Int
    var windSpeed: Double
    var windDirection: Int

    init(cityName: String, countryName: String, weatherType: WeatherType,
         currentTemperature: Double, feelsTemperature: Double, pressure: Int,
         humidity: Int, windSpeed: Double, windDirection: Int) {
        self.cityName = cityName
        self.countryName = countryName
        self.weatherType = weatherType
        self.currentTemperature = currentTemperature
        self.feelsTemperature = feelsTemperature
        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.windDirection = windDirection
    }
}
