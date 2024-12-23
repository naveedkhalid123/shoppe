//
//  DeliveryTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 23/12/2024.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var deliveryView: UIView!
    @IBOutlet weak var deliveryTypeLbl: UILabel!
    @IBOutlet weak var deliveryDaysLbl: UILabel!
    @IBOutlet weak var deliveryPriceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let themeColor = UIColor(named: "theme") {
            deliveryView.layer.borderColor = themeColor.cgColor
        }
        deliveryView.layer.cornerRadius = 10
        deliveryView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
