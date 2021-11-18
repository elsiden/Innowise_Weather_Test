//
//  TodayWeatherVC+Initialize.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 18.11.2021.
//

import UIKit

extension TodayWeatherVC {
    func initialize() {
        weatherImage.tintColor = UIColor(red: 255/255, green: 168/255, blue: 18/255, alpha: 1)
        view.addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.size.equalTo(view.bounds.width/3)
        }
        
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
        }
        
        degreesAndTypeLabel.font = UIFont.systemFont(ofSize: 20)
        degreesAndTypeLabel.textColor = UIColor(red: 0/255, green: 140/255, blue: 240/255, alpha: 1)
        view.addSubview(degreesAndTypeLabel)
        degreesAndTypeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).offset(15)
        }
        
        let dividerTopView = UIView()
        dividerTopView.backgroundColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        view.addSubview(dividerTopView)
        dividerTopView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreesAndTypeLabel.snp.bottom).offset(25)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(100)
        }
        
        let humidityView = UIView()
        view.addSubview(humidityView)
        humidityView.snp.makeConstraints { make in
            make.size.equalTo((view.bounds.width - 10)/5)
            make.top.equalTo(dividerTopView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(5)
        }
        
        setWeatherIcons(where: UIImage(systemName: "humidity")!, and: humidityView, and: humidityLabel)
        
        let windSpeedView = UIView()
        view.addSubview(windSpeedView)
        windSpeedView.snp.makeConstraints { make in
            make.size.equalTo(humidityView)
            make.top.equalTo(humidityView.snp.bottom)
            make.left.equalTo(humidityView.snp.right)
        }
        
        setWeatherIcons(where: UIImage(systemName: "wind")!, and: windSpeedView, and: windSpeedLabel)

        let feelsTempView = UIView()
        view.addSubview(feelsTempView)
        feelsTempView.snp.makeConstraints { make in
            make.size.equalTo(humidityView)
            make.left.equalTo(windSpeedView.snp.right)
            make.top.equalTo(humidityView.snp.top)
        }
        
        setWeatherIcons(where: UIImage(systemName: "thermometer")!, and: feelsTempView, and: feelsTempLabel)

        let windDirectionView = UIView()
        view.addSubview(windDirectionView)
        windDirectionView.snp.makeConstraints { make in
            make.size.equalTo(humidityView)
            make.left.equalTo(feelsTempView.snp.right)
            make.top.equalTo(windSpeedView.snp.top)
        }
        
        setWeatherIcons(where: UIImage(systemName: "safari")!, and: windDirectionView, and: windDirectionLabel)
        
        let pressureView = UIView()
        view.addSubview(pressureView)
        pressureView.snp.makeConstraints { make in
            make.size.equalTo(humidityView)
            make.left.equalTo(windDirectionView.snp.right)
            make.top.equalTo(humidityView.snp.top)
        }
        
        setWeatherIcons(where: UIImage(systemName: "barometer")!, and: pressureView, and: pressureLabel)
        
        let dividerBottomView = UIView()
        dividerBottomView.backgroundColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        view.addSubview(dividerBottomView)
        dividerBottomView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(windSpeedView.snp.bottom).offset(5)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(100)
        }
        
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(UIColor(red: 239/255, green: 48/255, blue: 56/255, alpha: 1), for: .normal)
        shareButton.addTarget(self, action: #selector(weatherShare(_:)), for: UIControl.Event.touchUpInside)
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dividerBottomView.snp.bottom).offset(15)
        }
    }
    
    func setWeatherIcons(where iconImage: UIImage, and view: UIView, and infoLabel: UILabel) {
        let icon = UIImageView()
        icon.image = iconImage
        icon.tintColor = UIColor(red: 255/255, green: 168/255, blue: 18/255, alpha: 1)
        view.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalTo(view.snp.width).offset(-40)
            make.height.equalTo(view.snp.height).offset(-40)
        }
        
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(icon.snp.centerX)
            make.top.equalTo(icon.snp.bottom)
        }
    }
}
