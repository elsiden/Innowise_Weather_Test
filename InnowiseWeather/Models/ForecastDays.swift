//
//  ForecastDays.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit

class ForecastDays {
    var cellsInDays: [[String]]
    var days: [String]
    
    init(cellsInDays: [[String]], days: [String]) {
        self.cellsInDays = cellsInDays
        self.days = days
    }
}
