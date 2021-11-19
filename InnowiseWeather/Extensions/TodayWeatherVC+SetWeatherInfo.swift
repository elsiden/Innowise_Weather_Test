//
//  SetWeatherInfo.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 17.11.2021.
//

import UIKit

extension TodayWeatherVC {
    func setCurrentWeather(where currentWeather: WeatherToday) {
        iconWeather = currentWeather.weatherType.iconWeather
        cityName = currentWeather.cityName
        countryName = currentWeather.countryName
        currentTemperature = currentWeather.currentTemperature
        descriptionWeather = currentWeather.weatherType.descriptionWeather
        humidity = currentWeather.humidity
        windSpeed = currentWeather.windSpeed
        windDirection = currentWeather.windDirection
        feelsTemperature = currentWeather.feelsTemperature
        pressure = currentWeather.pressure
        setActualWeather()
    }
    
    func setActualWeather() {
        weatherImage.image = UIImage(systemName: iconWeather)
        locationLabel.text = "\(cityName), \(countryName)"
        degreesAndTypeLabel.text = "\(Int(currentTemperature - 273.15))°С | \(descriptionWeather)"
        humidityLabel.text = "\(humidity)%"
        windSpeedLabel.text = "\(windSpeed) km/h"
        feelsTempLabel.text = "\(Int(feelsTemperature - 273.15))°С"
        windDirectionLabel.text = setWindDirection(where: windDirection)
        pressureLabel.text = "\(pressure) hPa"
    }
}
