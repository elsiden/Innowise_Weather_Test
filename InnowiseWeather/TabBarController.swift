//
//  TabBarController.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 12.11.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
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
            createNavController(for: ViewController(), title: "Today", image: UIImage(systemName: "sun.max.fill")!),
            createNavController(for: ViewController(), title: "Forecast", image: UIImage(systemName: "cloud.sun.bolt.fill")!)
        ]
    }

}
