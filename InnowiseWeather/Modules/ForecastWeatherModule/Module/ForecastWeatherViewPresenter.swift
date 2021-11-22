//
//  ForecastWeatherViewPresenter.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit

protocol ForecastWeatherViewPresenter {
    func setCellsInDays(where currentWeather: [WeatherForecast]) -> [[String]]
    func setDays(where currentWeather: [WeatherForecast]) -> [String]
}

class ForecastWeatherPresenter: ForecastWeatherViewPresenter {
    
    var cellsInDays: [[String]] = []
    var days: [String] = []
    
    func setCellsInDays(where currentWeather: [WeatherForecast]) -> [[String]] {
        var mas: [String] = []
        cellsInDays.removeAll()
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
        return cellsInDays
    }
    
    func setDays(where currentWeather: [WeatherForecast]) -> [String] {
        days.removeAll()
        for value in currentWeather {
            if value.day != days.last {
                days.append(value.day)
            }
        }
        return days
    }
}
