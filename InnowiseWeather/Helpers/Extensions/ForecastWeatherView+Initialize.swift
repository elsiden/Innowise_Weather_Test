//
//  ForecastWeatherView+Initialize.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 19.11.2021.
//

import UIKit

extension ForecastWeatherView {
    func initializeSecondPage() {
        weatherTableView.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        view.addSubview(weatherTableView)
        weatherTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
    }
}
