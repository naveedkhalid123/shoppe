//
//  Extension.swift
//  Shoppe
//
//  Created by Naveed Khalid on 11/12/2024.
//

import Foundation
import UIKit

extension UIView {
  // OUTPUT 1
    func dropShadow(color: UIColor) {
    layer.masksToBounds = false
        layer.shadowColor = color.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowRadius = 1
  }
}

extension UserDefaults {

    // Save data
    func saveData(forKey key: String, value: String) {
        set(value, forKey: key)
    }

    // Retrieve data
    func retreiveData(forKey key: String) -> String? {
        return string(forKey: key) ?? ""
    }
}


extension UIViewController {
    func showAlert(message: String, title: String = "Error") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

