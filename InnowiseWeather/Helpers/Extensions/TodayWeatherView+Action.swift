//
//  TodayWeatherView+Action.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 18.11.2021.
//

import UIKit

extension TodayWeatherView {
    @objc
    func weatherShare(_ sender: UIButton) {
        guard let currentWeather = currentWeather else { return }
        
        weatherForShare.removeAll()
        weatherForShare.append("Hi! Today in \(currentWeather.cityName), \(currentWeather.countryName) is \(currentWeather.weatherType.descriptionWeather)")
        weatherForShare.append("Temperature: \(Int(currentWeather.currentTemperature - 273.15))°С, but feels like: \(Int(currentWeather.feelsTemperature - 273.15))°С")
        weatherForShare.append("Humidity: \(currentWeather.humidity)%\nPressure: \(currentWeather.pressure) hPa")
        weatherForShare.append("Wind speed: \(currentWeather.windSpeed) km/h\nWind direction: \(presenter.setWindDirection(where: currentWeather.windDirection))")
        
        let shareController = UIActivityViewController(activityItems: weatherForShare, applicationActivities: nil)
        
//        shareController.popoverPresentationController?.barButtonItem = sender
//        shareController.popoverPresentationController?.permittedArrowDirections = .any
        
        present(shareController, animated: true, completion: nil)
    }
}
