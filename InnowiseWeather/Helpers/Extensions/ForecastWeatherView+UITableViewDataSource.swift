//
//  ForecastWeatherView+UITableViewDataSource.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit

extension ForecastWeatherView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard currentWeather != nil else { return 0 }
        return forecastDays.days.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard currentWeather != nil else { return "" }
        
        switch section {
        case 0, 1, 2, 3, 4, 5:
            return forecastDays.days[section]
        default:
            return "Unknown section"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard currentWeather != nil else { return 0 }
        
        switch section {
        case 0, 1, 2, 3, 4, 5:
            return forecastDays.cellsInDays[section].count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard currentWeather != nil else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as! ForecastTableViewCell
        cell.weather = currentWeather?[indexPath.row]
        return cell
    }
}
