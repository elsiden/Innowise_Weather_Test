//
//  ForecastWeatherVC+SetInfo.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 19.11.2021.
//

import UIKit

extension ForecastWeatherVC {
    func setCellsInDays(where currentWeather: [WeatherForecast]) {
        var mas: [String] = []
        for value in currentWeather {
            if value.time == "00:00" && !mas.isEmpty {
                cellsInDays.append(mas)
                mas.removeAll()
                mas.append(value.time)
            } else {
                mas.append(value.time)
            }
        }
        cellsInDays.append(mas)
    }
    
    func setDays(where currentWeather: [WeatherForecast]) {
        for value in currentWeather {
            if value.day != days.last {
                days.append(value.day)
            }
        }
    }
}
