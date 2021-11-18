//
//  SetWeatherInfo.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 17.11.2021.
//

import UIKit

extension TodayWeatherVC {
    func setCurrentWeather(where currentWeather: Weather) {
        iconWeather = currentWeather.listOfWeather[0].weatherType.iconWeather
        cityName = currentWeather.cityName
        countryName = currentWeather.countryName
        currentTemperature = currentWeather.listOfWeather[0].weatherDescription.currentTemperature
        descriptionWeather = currentWeather.listOfWeather[0].weatherType.descriptionWeather
        humidity = currentWeather.listOfWeather[0].weatherDescription.humidity
        windSpeed = currentWeather.listOfWeather[0].windInfo.windSpeed
        windDirection = currentWeather.listOfWeather[0].windInfo.windDirection
        feelsTemperature = currentWeather.listOfWeather[0].weatherDescription.feelsTemperature
        pressure = currentWeather.listOfWeather[0].weatherDescription.pressure
        setActualWeather()
    }
    
    func setActualWeather() {
        weatherImage.image = setWeatherImage(where: iconWeather)
        locationLabel.text = "\(cityName), \(countryName)"
        degreesAndTypeLabel.text = "\(Int(currentTemperature - 273.15))°С | \(descriptionWeather)"
        humidityLabel.text = "\(humidity)%"
        windSpeedLabel.text = "\(windSpeed) km/h"
        feelsTempLabel.text = "\(Int(feelsTemperature - 273.15))°С"
        windDirectionLabel.text = setWindDirection(where: windDirection)
        pressureLabel.text = "\(pressure) hPa"
    }
    
    func setWeatherImage(where imageName: String) -> UIImage {
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
            return UIImage(systemName: "sun.max")!
        } else if imageName == clearNightSky {
            return UIImage(systemName: "moon.stars")!
        } else if imageName == fewDayClouds {
            return UIImage(systemName: "cloud.sun")!
        } else if imageName == fewNightClouds {
            return UIImage(systemName: "cloud.moon")!
        } else if imageName == scatteredDayClouds || imageName == scatteredNightClouds ||
                    imageName == brokenDayClouds || imageName == brokenNightClouds {
            return UIImage(systemName: "cloud")!
        } else if imageName == showerDayRain || imageName == showerNightRain {
            return UIImage(systemName: "cloud.rain")!
        } else if imageName == rainDay {
            return UIImage(systemName: "cloud.sun.rain")!
        } else if imageName == rainNight {
            return UIImage(systemName: "cloud.moon.rain")!
        } else if imageName == thunderstormDay || imageName == thunderstormNight {
            return UIImage(systemName: "cloud.bolt")!
        } else if imageName == snowDay || imageName == snowNight {
            return UIImage(systemName: "snow")!
        } else if imageName == mistDay || imageName == mistNight {
            return UIImage(systemName: "cloud.fog")!
        } else {
            return UIImage()
        }
    }
}
