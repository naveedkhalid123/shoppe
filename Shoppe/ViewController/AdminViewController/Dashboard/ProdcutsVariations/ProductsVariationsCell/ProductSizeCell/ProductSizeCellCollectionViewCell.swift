//
//  ProductSizeCellCollectionViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 06/01/2025.
//

import UIKit

class ProductSizeCellCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var sizeLbl: UILabel!
    
    @IBOutlet weak var sizeView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sizeView.layer.cornerRadius = 4
    }

}
