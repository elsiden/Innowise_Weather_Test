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
    var currentWeather: [WeatherForecast?]?
    var cellsInDays: [[String]] = []
    var days: [String] = []
    
    var weatherImage: UIImageView = UIImageView()
    var timeLabel: UILabel = UILabel()
    var weatherLabel: UILabel = UILabel()
    var degreesLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension ForecastWeatherVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = locations.first?.coordinate else { return }
        
        HTTPManager.shared.getWeatherForecast(where: coordinate.latitude, and: coordinate.longitude) { weather in
            self.currentWeather = weather
            
            guard self.currentWeather != nil else { return }
            
            DispatchQueue.main.async {
                
                self.setCellsInDays()
                self.setDays()
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
        case 0:
            return "Today"
        case 1, 2, 3, 4, 5:
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
