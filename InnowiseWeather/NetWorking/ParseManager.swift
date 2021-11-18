//
//  ParseManager.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 15.11.2021.
//

import UIKit

class ParseManager {
    static let shared = ParseManager()
    
    func getParseData(where data: Data) -> Weather? {
        guard let jsonWeather = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] else { return nil }
        
        guard let city = jsonWeather["city"] as? [String: Any],
              let cityName = city["name"] as? String,
              let countryName = city["country"] as? String else { return nil }
        
        var listOfWeather: [ListOfWeather] = []
        guard let list = jsonWeather["list"] as? [[String: Any]] else { return nil }
        for value in list {
            guard let time = value["dt"] as? Int else { return nil }
            
            guard let main = value["main"] as? [String: Any],
                  let feelsTemperature = main["feels_like"] as? Double,
                  let currentTemperature = main["temp"] as? Double,
                  let pressure = main["pressure"] as? Int,
                  let humidity = main["humidity"] as? Int else { return nil }
            let weatherDescription: WeatherDescription = WeatherDescription(currentTemperature: currentTemperature, feelsTemperature: feelsTemperature,
                                                                            humidity: humidity, pressure: pressure)
            
            var weatherType: WeatherType = WeatherType(descriptionWeather: "", iconWeather: "")
            guard let weather = value["weather"] as? [[String: Any]] else { return nil }
            for i in weather {
                guard let descriptionWeather = i["description"] as? String,
                      let iconWeather = i["icon"] as? String else { return nil }
                weatherType = WeatherType(descriptionWeather: descriptionWeather.capitalized, iconWeather: iconWeather)
            }
            
            guard let wind = value["wind"] as? [String: Any],
                  let windSpeed = wind["speed"] as? Double,
                  let windDirection = wind["deg"] as? Int else { return nil }
            let windInfo: WindInfo = WindInfo(windSpeed: windSpeed, windDirection: windDirection)
            
            let elementOfList: ListOfWeather = ListOfWeather(time: Date(timeIntervalSince1970: TimeInterval(time)), weatherDescription: weatherDescription, weatherType: weatherType, windInfo: windInfo)
            listOfWeather.append(elementOfList)
        }
              
        return Weather(cityName: cityName, countryName: countryName, listOfWeather: listOfWeather)
    }
}
