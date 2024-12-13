//
//  CategoriesCollectionViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 12/12/2024.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryNumbers: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
