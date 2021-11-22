//
//  ForecastWeatherView+Location.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit
import CoreLocation

extension ForecastWeatherView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else {
            presentAlertController(with: "Your coordinates were not received, try again later", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        HTTPManager.shared.getWeatherForecast(where: coordinate.latitude, and: coordinate.longitude) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else {
                self.presentAlertController(with: "Data of weather were not received, check your connection", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
                return
            }
            
            DispatchQueue.main.async { [self] in
                
                self.forecastDays.cellsInDays.removeAll()
                self.forecastDays.days.removeAll()
                self.forecastDays.cellsInDays = self.presenter.setCellsInDays(where: self.currentWeather ?? [])
                self.forecastDays.days = self.presenter.setDays(where: self.currentWeather ?? [])
                self.weatherTableView.reloadData()
            }
        }
    }
}
