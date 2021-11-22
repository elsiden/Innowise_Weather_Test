//
//  ForecastTableViewCell+Initialize.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit

extension ForecastTableViewCell {
    func initialize() {
        self.contentView.addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.size.equalTo(60)
        }
        
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherImage.snp.top).offset(10)
            make.left.equalTo(weatherImage.snp.right).offset(20)
        }
        
        self.contentView.addSubview(weatherLabel)
        weatherLabel.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom)
            make.left.equalTo(weatherImage.snp.right).offset(20)
        }
        
        self.contentView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
        }
    }
}
