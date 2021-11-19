//
//  HttpManager.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 15.11.2021.
//

import UIKit
import Alamofire

class HTTPManager {
    static let shared = HTTPManager()
    
    func getWeatherForecast(where latitude: Double, and longitude: Double, _ onCompletion: @escaping ([WeatherForecast?]?) -> ()) {
        AF.request("https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=016467d388062bf4c642b3df500e17d3").response(queue: DispatchQueue.global(qos: .userInteractive)) { response in
            guard let data = response.data,
                  let currentWeather = ParseManager.shared.getParseDataForecast(where: data) else {
                onCompletion ([])
                return
            }
            onCompletion(currentWeather)
        }
    }
    
    func getWeatherToday(where latitude: Double, and longitude: Double, _ onCompletion: @escaping (WeatherToday?) -> ()) {
        AF.request("https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=016467d388062bf4c642b3df500e17d3").response(queue: DispatchQueue.global(qos: .userInteractive)) { response in
            guard let data = response.data,
                  let currentWeather = ParseManager.shared.getParseDataToday(where: data) else {
                onCompletion (nil)
                return
            }
            onCompletion(currentWeather)
        }
    }
}
