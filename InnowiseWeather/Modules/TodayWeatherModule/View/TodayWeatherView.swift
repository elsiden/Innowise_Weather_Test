//
//  TodayWeatherView.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 14.11.2021.
//

import UIKit
import SnapKit
import CoreLocation

class TodayWeatherView: UIViewController {
    
    var weatherImage: UIImageView = UIImageView()
    var locationLabel: UILabel = UILabel()
    var degreesAndTypeLabel: UILabel = UILabel()
    var humidityLabel: UILabel = UILabel()
    var windSpeedLabel: UILabel = UILabel()
    var feelsTempLabel: UILabel = UILabel()
    var windDirectionLabel: UILabel = UILabel()
    var pressureLabel: UILabel = UILabel()
    var shareButton: UIButton = UIButton()

    let locationManager = CLLocationManager()
    var currentWeather: WeatherToday?
    let presenter = TodayWeatherPresenter()
    
    var weatherForShare: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeFirstPage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard isConnectedToNetwork() else {
            presentAlertController(with: "Your connection is absent", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        setupLocation { result in
            guard result else { return }
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func setupLocation(_ completion: (Bool) -> ()) {
        guard CLLocationManager.locationServicesEnabled() else {
            presentAlertController(with: "Your geolocation services are disabled", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            completion(false)
            return
        }
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            completion(true)
        case .denied:
            presentAlertController(with: "You have forbidden the application to use your location", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            completion(false)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default: break
        }
    }
}
