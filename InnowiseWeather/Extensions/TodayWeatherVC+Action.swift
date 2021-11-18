//
//  TodayWeatherVC+Action.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 18.11.2021.
//

import UIKit

extension TodayWeatherVC {
    @objc
    func weatherShare(_ sender: UIButton) {
        guard currentWeather != nil else { return }
        
        weatherForShare.removeAll()
        weatherForShare.append("Hi! Today in \(cityName), \(countryName) is \(descriptionWeather)")
        weatherForShare.append("Temperature: \(Int(currentTemperature - 273.15))°С, but feels like: \(Int(feelsTemperature - 273.15))°С")
        weatherForShare.append("Humidity: \(humidity)%\nPressure: \(pressure) hPa")
        weatherForShare.append("Wind speed: \(windSpeed) km/h\nWind direction: \(setWindDirection(where: windDirection))")
        
        let shareController = UIActivityViewController(activityItems: weatherForShare, applicationActivities: nil)
        
//        shareController.popoverPresentationController?.barButtonItem = sender
//        shareController.popoverPresentationController?.permittedArrowDirections = .any
        
        present(shareController, animated: true, completion: nil)
    }
}
