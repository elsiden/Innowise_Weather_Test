//
//  TabBarController.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 12.11.2021.
//

import UIKit
import SnapKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1))
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1))
            
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        }
        
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        
        rootViewController.navigationItem.title = title
        
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: TodayWeatherVC(), title: "Today", image: UIImage(systemName: "sun.max.fill")!),
            createNavController(for: ForecastWeatherVC(), title: "Forecast", image: UIImage(systemName: "cloud.sun.bolt.fill")!)
        ]
    }

}
