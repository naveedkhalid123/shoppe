//
//  DashboardCollectionViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 03/01/2025.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
    
    
    
    
    @IBOutlet weak var viewLbl: UIView!
    @IBOutlet weak var dashboardLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewLbl.layer.cornerRadius = 18
    }

}
