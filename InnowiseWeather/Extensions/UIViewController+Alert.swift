//
//  UIViewController+Alert.swift
//  InnowiseWeather
//
//  Created by Ivan Klishevich on 19.11.2021.
//

import UIKit

extension UIViewController {
    @discardableResult
    func presentAlertController(with message: String?, prefferedStyle: UIAlertController.Style = .alert, actions: UIAlertAction...) -> UIAlertController {
        let alert = UIAlertController(title: "Oops, we have problem...", message: message, preferredStyle: prefferedStyle)
        actions.forEach { alert.addAction($0)}
        present(alert, animated: true, completion: nil)
        
        return alert
    }
}

