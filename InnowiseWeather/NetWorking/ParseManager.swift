//
//  ParseManager.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 15.11.2021.
//

import UIKit

class ParseManager {
    static let shared = ParseManager()
    
    func getParseDataForecast(where data: Data) -> [WeatherForecast?]? {
        guard let jsonWeather = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else { return [] }
        
        var listOfWeather: [WeatherForecast] = []
        guard let list = jsonWeather["list"] as? [[String: Any]] else { return [] }
        
        let timeFormatter = DateFormatter()
        let dayFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        dayFormatter.dateFormat = "EEEE"
        for value in list {
            guard let date = value["dt"] as? Int else { return [] }
            let time = timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
            let day = dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
            
            guard let main = value["main"] as? [String: Any],
                  let currentTemperature = main["temp"] as? Double else { return [] }
            
            var weatherType: WeatherType = WeatherType(descriptionWeather: "", iconWeather: "")
            guard let weather = value["weather"] as? [[String: Any]] else { return [] }
            for i in weather {
                guard let descriptionWeather = i["description"] as? String,
                      let iconWeather = i["icon"] as? String else { return [] }
                weatherType = WeatherType(descriptionWeather: descriptionWeather.capitalized, iconWeather: setWeatherImage(where: iconWeather))
            }
            
            let elementOfWeather: WeatherForecast = WeatherForecast(time: time, day: day, currentTemperature: currentTemperature, weatherType: weatherType)
            listOfWeather.append(elementOfWeather)
        }
              
        return listOfWeather
    }
    
    func getParseDataToday(where data: Data) -> WeatherToday? {
        guard let jsonWeather = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { return nil }

        guard let cityName = jsonWeather["name"] as? String else { return nil }

        var weatherType: WeatherType = WeatherType(descriptionWeather: "", iconWeather: "")
        guard let weather = jsonWeather["weather"] as? [[String: Any]] else { return nil }
        for value in weather {
            guard let descriptionWeather = value["description"] as? String,
                  let iconWeather = value["icon"] as? String else { return nil }
            weatherType = WeatherType(descriptionWeather: descriptionWeather.capitalized, iconWeather: setWeatherImage(where: iconWeather))
        }
          
        guard let sys = jsonWeather["sys"] as? [String: Any],
              let countryName = sys["country"] as? String else { return nil }
        
        guard let main = jsonWeather["main"] as? [String: Any],
              let feelsTemperature = main["feels_like"] as? Double,
              let currentTemperature = main["temp"] as? Double,
              let pressure = main["pressure"] as? Int,
              let humidity = main["humidity"] as? Int else { return nil }
        
        guard let wind = jsonWeather["wind"] as? [String: Any],
              let windSpeed = wind["speed"] as? Double,
              let windDirection = wind["deg"] as? Int else { return nil }

        return WeatherToday(cityName: cityName, countryName: countryName, weatherType: weatherType,
                            currentTemperature: currentTemperature, feelsTemperature: feelsTemperature, pressure: pressure,
                            humidity: humidity, windSpeed: windSpeed, windDirection: windDirection)
    }
}
