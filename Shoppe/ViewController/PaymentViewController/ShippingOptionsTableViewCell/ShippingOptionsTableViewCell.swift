//
//  ShippingOptionsTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 18/12/2024.
//

import UIKit

class ShippingOptionsTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var checkOptionsImage: UIImageView!
    @IBOutlet weak var shippingCategory: UILabel!
    @IBOutlet weak var shippingDuration: UILabel!
    @IBOutlet weak var shippingPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
