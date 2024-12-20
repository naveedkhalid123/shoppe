//
//  TrackingOrderTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class TrackingOrderTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderDescription: UILabel!
    @IBOutlet weak var orderTimeAndDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
