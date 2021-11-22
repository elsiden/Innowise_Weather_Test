//
//  TodayWeatherView+Location.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit
import CoreLocation

extension TodayWeatherView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else {
            presentAlertController(with: "Your coordinates were not received, try again later", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        HTTPManager.shared.getWeatherToday(where: coordinate.latitude, and: coordinate.longitude) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else {
                self.presentAlertController(with: "Data of weather were not received, check your connection", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
                return
            }
            
            DispatchQueue.main.async {
                guard let currentWeather = self.currentWeather else { return }
                
                self.setActualWeather(where: currentWeather)
            }
        }
    }
}
