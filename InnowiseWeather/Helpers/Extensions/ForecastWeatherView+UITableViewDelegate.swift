//
//  ForecastWeatherView+UITableViewDelegate.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit

extension ForecastWeatherView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weatherTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
