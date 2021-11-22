//
//  ParseManager+SetWeatherImage.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 19.11.2021.
//

import UIKit

extension ParseManager {
    func setWeatherImage(where imageName: String) -> String {
        let clearDaySky: String = "01d"
        let clearNightSky: String = "01n"
        let fewDayClouds: String = "02d"
        let fewNightClouds: String = "02n"
        let scatteredDayClouds: String = "03d"
        let scatteredNightClouds: String = "03n"
        let brokenDayClouds: String = "04d"
        let brokenNightClouds: String = "04n"
        let showerDayRain: String = "09d"
        let showerNightRain: String = "09n"
        let rainDay: String = "10d"
        let rainNight: String = "10n"
        let thunderstormDay: String = "11d"
        let thunderstormNight: String = "11n"
        let snowDay: String = "13d"
        let snowNight: String = "13n"
        let mistDay: String = "50d"
        let mistNight: String = "50n"
        
        if imageName == clearDaySky {
            return "sun.max"
        } else if imageName == clearNightSky {
            return "moon.stars"
        } else if imageName == fewDayClouds {
            return "cloud.sun"
        } else if imageName == fewNightClouds {
            return "cloud.moon"
        } else if imageName == scatteredDayClouds || imageName == scatteredNightClouds ||
                    imageName == brokenDayClouds || imageName == brokenNightClouds {
            return "cloud"
        } else if imageName == showerDayRain || imageName == showerNightRain {
            return "cloud.rain"
        } else if imageName == rainDay {
            return "cloud.sun.rain"
        } else if imageName == rainNight {
            return "cloud.moon.rain"
        } else if imageName == thunderstormDay || imageName == thunderstormNight {
            return "cloud.bolt"
        } else if imageName == snowDay || imageName == snowNight {
            return "snow"
        } else if imageName == mistDay || imageName == mistNight {
            return "cloud.fog"
        } else {
            return ""
        }
    }
}
