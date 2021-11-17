//
//  TodayWeatherVC.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 14.11.2021.
//

import UIKit
import SnapKit
import CoreLocation

class TodayWeatherVC: UIViewController {
    
    let locationManager = CLLocationManager()
    var currentWeather: Weather?
    
    var iconWeather: String = ""
    var cityName: String = ""
    var countryName: String = ""
    var currentTemperature: Double = 0
    var descriptionWeather: String = ""
    var humidity: Int = 0
    var windSpeed: Double = 0
    var windDirection: Int = 0
    var feelsTemperature: Double = 0
    var pressure: Int = 0
    
    var weatherImage: UIImageView = UIImageView()
    var locationLabel: UILabel = UILabel()
    var degreesAndTypeLabel: UILabel = UILabel()
    var humidityLabel: UILabel = UILabel()
    var windSpeedLabel: UILabel = UILabel()
    var feelsTempLabel: UILabel = UILabel()
    var windDirectionLabel: UILabel = UILabel()
    var pressureLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation { result in
            guard result else { return }
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
        }
    }
    
    private func initialize() {
        weatherImage.tintColor = UIColor(red: 255/255, green: 220/255, blue: 51/255, alpha: 1)
        view.addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.size.equalTo(CGSize(width: 90, height: 90))
        }
        
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
        }
        
        degreesAndTypeLabel.font = UIFont.systemFont(ofSize: 20)
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
            make.size.equalTo(view.bounds.width/5)
            make.top.equalTo(dividerTopView.snp.bottom).offset(15)
            make.left.equalToSuperview()
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
        
        let shareButton = UIButton()
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(UIColor(red: 239/255, green: 48/255, blue: 56/255, alpha: 1), for: .normal)
        view.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dividerBottomView.snp.bottom).offset(15)
        }
    }
    
    private func setWeatherIcons(where iconImage: UIImage, and view: UIView, and infoLabel: UILabel) {
        let icon = UIImageView()
        icon.image = iconImage
        icon.tintColor = UIColor(red: 255/255, green: 220/255, blue: 51/255, alpha: 1)
        view.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.size.equalTo(CGSize(width: 25, height: 25))
        }
        
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(icon.snp.centerX)
            make.top.equalTo(icon.snp.bottom)
        }
    }
    
    func setupLocation(_ completion: (Bool) -> ()) {
        guard CLLocationManager.locationServicesEnabled() else {
            completion(false)
            return
        }
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            completion(true)
        case .denied:
            completion(false)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default: break
        }
    }
    
    private func setActualWeather() {
        weatherImage.image = setWeatherImage(where: iconWeather)
        locationLabel.text = "\(cityName), \(countryName)"
        degreesAndTypeLabel.text = "\(Int(currentTemperature - 273.15))°С | \(descriptionWeather)"
        humidityLabel.text = "\(humidity)%"
        windSpeedLabel.text = "\(windSpeed) km/h"
        feelsTempLabel.text = "\(Int(feelsTemperature - 273.15))°С"
        windDirectionLabel.text = setWindDirection(where: windDirection)
        pressureLabel.text = "\(pressure) hPa"
    }
}

extension TodayWeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        
        HTTPManager.shared.getWeather(where: coordinate.latitude, and: coordinate.longitude) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else { return }
            
            DispatchQueue.main.async {
                guard let currentWeather = self.currentWeather else { return }
                
                self.iconWeather = currentWeather.listOfWeather[0].weatherType.iconWeather
                self.cityName = currentWeather.cityName
                self.countryName = currentWeather.countryName
                self.currentTemperature = currentWeather.listOfWeather[0].weatherDescription.currentTemperature
                self.descriptionWeather = currentWeather.listOfWeather[0].weatherType.descriptionWeather
                self.humidity = currentWeather.listOfWeather[0].weatherDescription.humidity
                self.windSpeed = currentWeather.listOfWeather[0].windInfo.windSpeed
                self.windDirection = currentWeather.listOfWeather[0].windInfo.windDirection
                self.feelsTemperature = currentWeather.listOfWeather[0].weatherDescription.feelsTemperature
                self.pressure = currentWeather.listOfWeather[0].weatherDescription.pressure
                self.setActualWeather()
            }
        }
    }
}
