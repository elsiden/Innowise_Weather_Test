//
//  ForecastWeatherView.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 14.11.2021.
//

import UIKit
import SnapKit
import CoreLocation

class ForecastWeatherView: UIViewController {
    
    let weatherTableView = UITableView()
    var weatherImage: UIImageView = UIImageView()
    var timeLabel: UILabel = UILabel()
    var weatherLabel: UILabel = UILabel()
    var degreesLabel: UILabel = UILabel()
    
    let locationManager = CLLocationManager()
    var currentWeather: [WeatherForecast]?
    var forecastDays = ForecastDays(cellsInDays: [[]], days: [])
    let presenter = ForecastWeatherPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard isConnectedToNetwork() else {
            presentAlertController(with: "Your connection is absent", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        initializeSecondPage()
        weatherTableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "forecastCell")
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
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
