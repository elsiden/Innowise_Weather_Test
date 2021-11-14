//
//  TodayWeatherVC.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 14.11.2021.
//

import UIKit
import SnapKit

class TodayWeatherVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    private func initialize() {
        let weatherImage = UIImageView()
        weatherImage.image = UIImage(systemName: "sun.max")
        weatherImage.tintColor = UIColor(red: 255/255, green: 220/255, blue: 51/255, alpha: 1)
        view.addSubview(weatherImage)
        weatherImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.size.equalTo(CGSize(width: 90, height: 90))
        }
        
        let locationLabel = UILabel()
        locationLabel.text = "Location"
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherImage.snp.bottom).offset(20)
        }
        
        let degreesLabel = UILabel()
        degreesLabel.text = "Degrees | Weather type"
        degreesLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(degreesLabel)
        degreesLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(locationLabel.snp.bottom).offset(15)
        }
        
        let dividerTopView = UIView()
        dividerTopView.backgroundColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        view.addSubview(dividerTopView)
        dividerTopView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(degreesLabel.snp.bottom).offset(25)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(100)
        }
        
        let oneView = UIView()
        view.addSubview(oneView)
        oneView.snp.makeConstraints { make in
            make.size.equalTo(view.bounds.width/5)
            make.top.equalTo(dividerTopView.snp.bottom).offset(5)
            make.left.equalToSuperview()
        }
        
        setWeatherIcon(where: UIImage(systemName: "sun.min.fill")!, and: oneView)
        
        let secondView = UIView()
        view.addSubview(secondView)
        secondView.snp.makeConstraints { make in
            make.size.equalTo(oneView)
            make.top.equalTo(oneView.snp.bottom)
            make.left.equalTo(oneView.snp.right)
        }
        
        setWeatherIcon(where: UIImage(systemName: "sun.min.fill")!, and: secondView)

        let thirdView = UIView()
        view.addSubview(thirdView)
        thirdView.snp.makeConstraints { make in
            make.size.equalTo(oneView)
            make.left.equalTo(secondView.snp.right)
            make.top.equalTo(oneView.snp.top)
        }
        
        setWeatherIcon(where: UIImage(systemName: "sun.min.fill")!, and: thirdView)

        let fourthView = UIView()
        view.addSubview(fourthView)
        fourthView.snp.makeConstraints { make in
            make.size.equalTo(oneView)
            make.left.equalTo(thirdView.snp.right)
            make.top.equalTo(secondView.snp.top)
        }
        
        setWeatherIcon(where: UIImage(systemName: "sun.min.fill")!, and: fourthView)
        
        let fifthView = UIView()
        view.addSubview(fifthView)
        fifthView.snp.makeConstraints { make in
            make.size.equalTo(oneView)
            make.left.equalTo(fourthView.snp.right)
            make.top.equalTo(oneView.snp.top)
        }
        
        setWeatherIcon(where: UIImage(systemName: "sun.min.fill")!, and: fifthView)
        
        let dividerBottomView = UIView()
        dividerBottomView.backgroundColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        view.addSubview(dividerBottomView)
        dividerBottomView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(secondView.snp.bottom).offset(15)
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
    
    private func setWeatherIcon(where iconImage: UIImage, and view: UIView) {
        let icon = UIImageView()
        icon.image = iconImage
        icon.tintColor = UIColor(red: 255/255, green: 220/255, blue: 51/255, alpha: 1)
        view.addSubview(icon)
        icon.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
    }
}
