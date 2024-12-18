//
//  ItemsTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 18/12/2024.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemsImages: UIImageView!
    @IBOutlet weak var itemsDesc: UILabel!
    @IBOutlet weak var itemsPrice: UILabel!
    @IBOutlet weak var itemsNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
