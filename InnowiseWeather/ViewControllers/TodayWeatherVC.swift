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
    var currentWeather: WeatherToday?
    var weatherForShare: [String] = []
    
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
    var shareButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeFirstPage()
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
}

extension TodayWeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        
        HTTPManager.shared.getWeatherToday(where: coordinate.latitude, and: coordinate.longitude) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else { return }
            
            DispatchQueue.main.async {
                guard let currentWeather = self.currentWeather else { return }
                
                self.setCurrentWeather(where: currentWeather)
            }
        }
    }
}
