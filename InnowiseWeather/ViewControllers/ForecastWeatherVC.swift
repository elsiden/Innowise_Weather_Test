//
//  ForecastWeatherVC.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 14.11.2021.
//

import UIKit
import SnapKit
import CoreLocation

class ForecastWeatherVC: UIViewController {
    
    let locationManager = CLLocationManager()

    let weatherTableView = UITableView()
    var currentWeather: [WeatherForecast]?
    var cellsInDays: [[String]] = []
    var days: [String] = []
    
    var weatherImage: UIImageView = UIImageView()
    var timeLabel: UILabel = UILabel()
    var weatherLabel: UILabel = UILabel()
    var degreesLabel: UILabel = UILabel()
    
    var connection: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !isConnectedToNetwork() {
            presentAlertController(with: "Your connection is absent", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
        } else {
            connection = true
        }
        initializeSecondPage()
        weatherTableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: "forecastCell")
        weatherTableView.delegate = self
        weatherTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard connection else { return }
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

extension ForecastWeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else {
            presentAlertController(with: "Your coordinates were not received, try again later", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return
        }
        
        HTTPManager.shared.getWeatherForecast(where: coordinate.latitude, and: coordinate.longitude) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else {
                self.presentAlertController(with: "Data of weather were not received, check your connection", actions: UIAlertAction(title: "OK", style: .cancel, handler: nil))
                return
            }
            
            DispatchQueue.main.async {
                
                self.days.removeAll()
                self.cellsInDays.removeAll()
                self.setCellsInDays(where: self.currentWeather ?? [])
                self.setDays(where: self.currentWeather ?? [])
                self.weatherTableView.reloadData()
            }
        }
    }
}

extension ForecastWeatherVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard currentWeather != nil else { return 0 }
        return days.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard currentWeather != nil else { return "" }
        
        switch section {
        case 0, 1, 2, 3, 4, 5:
            return days[section]
        default:
            return "Unknown section"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard currentWeather != nil else { return 0 }
        
        switch section {
        case 0, 1, 2, 3, 4, 5:
            return cellsInDays[section].count
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

extension ForecastWeatherVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weatherTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
