//
//  OriginCollectionViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 23/12/2024.
//

import UIKit

class OriginCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var originView: UIView!
    @IBOutlet weak var originLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        originView.layer.cornerRadius = 4
    }

}
