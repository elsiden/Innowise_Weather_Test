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
    
    func getWeather(where latitude: Double, and longitude: Double, _ onCompletion: @escaping (Weather?) -> ()) {
        AF.request("https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=016467d388062bf4c642b3df500e17d3").response(queue: DispatchQueue.global(qos: .userInteractive)) { response in
            guard let data = response.data,
                  let currentWeather = ParseManager.shared.getParseData(where: data) else {
                onCompletion (nil)
                return
            }
            onCompletion(currentWeather)
        }
    }
}
