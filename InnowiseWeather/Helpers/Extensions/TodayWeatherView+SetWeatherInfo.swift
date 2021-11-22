//
//  TodayWeatherView+SetWeatherInfo.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 17.11.2021.
//

import UIKit

extension TodayWeatherView {
    func setActualWeather(where currentWeather: WeatherToday) {
        weatherImage.image = UIImage(systemName: currentWeather.weatherType.iconWeather)
        locationLabel.text = "\(currentWeather.cityName), \(currentWeather.countryName)"
        degreesAndTypeLabel.text = "\(Int(currentWeather.currentTemperature - 273.15))°С | \(currentWeather.weatherType.descriptionWeather)"
        humidityLabel.text = "\(currentWeather.humidity)%"
        windSpeedLabel.text = "\(currentWeather.windSpeed) km/h"
        feelsTempLabel.text = "\(Int(currentWeather.feelsTemperature - 273.15))°С"
        windDirectionLabel.text = presenter.setWindDirection(where: currentWeather.windDirection)
        pressureLabel.text = "\(currentWeather.pressure) hPa"
    }
}
