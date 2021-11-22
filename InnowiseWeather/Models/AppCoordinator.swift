//
//  AppCoordinator.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 21.11.2021.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let weather = TabBarController()
        window.rootViewController = weather
        window.makeKeyAndVisible()
    }
}
