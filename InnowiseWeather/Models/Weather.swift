//
//  Weather.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 15.11.2021.
//

import UIKit

class Weather {
    var cityName: String
    var countryName: String
    var listOfWeather: [ListOfWeather]

    init(cityName: String, countryName: String, listOfWeather: [ListOfWeather]) {
        self.cityName = cityName
        self.countryName = countryName
        self.listOfWeather = listOfWeather
    }
}
