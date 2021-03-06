//
//  ForecastTableViewCell.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 19.11.2021.
//

import UIKit
import SnapKit

class ForecastTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initialize()
     }

     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
    
    let weatherImage: UIImageView = {
        let image = UIImageView()
        image.tintColor = UIColor(red: 255/255, green: 168/255, blue: 18/255, alpha: 1)
        return image
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let weatherLabel: UILabel = {
        let weatherLabel = UILabel()
        return weatherLabel
    }()
    
    let temperatureLabel: UILabel = {
        let temperatureLabel = UILabel()
        temperatureLabel.font = UIFont.systemFont(ofSize: 50)
        temperatureLabel.textColor = UIColor(red: 0/255, green: 140/255, blue: 240/255, alpha: 1)
        return temperatureLabel
    }()
        
    var weather: WeatherForecast? {
        didSet {
            guard let weatherItem = weather else { return }
            
            weatherImage.image = UIImage(systemName: weatherItem.weatherType.iconWeather)
            timeLabel.text = weatherItem.time
            weatherLabel.text = weatherItem.weatherType.descriptionWeather
            temperatureLabel.text = "\(Int(weatherItem.currentTemperature - 273.15))°"
        }
    }
}
