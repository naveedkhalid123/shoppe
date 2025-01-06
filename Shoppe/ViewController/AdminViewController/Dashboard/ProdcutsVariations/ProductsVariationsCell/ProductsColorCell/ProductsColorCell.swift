//
//  ProductsColorCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 06/01/2025.
//

import UIKit

class ProductsColorCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var colorLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        colorView.layer.cornerRadius = 4
    }

}
