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

