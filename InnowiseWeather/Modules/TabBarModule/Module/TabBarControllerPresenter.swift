//
//  TabBarControllerPresenter.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 22.11.2021.
//

import UIKit

protocol TabBarControllerPresenter {
    func setupVCs() -> [UIViewController]
    func createNavController(for rootViewController: UIViewController,
                             title: String,
                             image: UIImage) -> UIViewController
}

class TabBarPresenter: TabBarControllerPresenter {
    func setupVCs() -> [UIViewController] {
        var viewControllers: [UIViewController] = []
        
        viewControllers = [
            createNavController(for: TodayWeatherView(), title: "Today", image: UIImage(systemName: "sun.max.fill")!),
            createNavController(for: ForecastWeatherView(), title: "Forecast", image: UIImage(systemName: "cloud.sun.bolt.fill")!)
        ]
        return viewControllers
    }
    
    func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true

        rootViewController.navigationItem.title = title

        return navController
    }
}
