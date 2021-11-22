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
        
        view.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1))
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(cgColor: CGColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1))
            
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        }
        
        tabBar.tintColor = .label
        
        let presenter = TabBarPresenter()
        viewControllers = presenter.setupVCs()
    }
}
