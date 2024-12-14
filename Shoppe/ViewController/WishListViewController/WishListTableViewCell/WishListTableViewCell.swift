//
//  WishListTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 14/12/2024.
//

import UIKit

class WishListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wishListImages: UIImageView!
    @IBOutlet weak var wishListDesc: UILabel!
    @IBOutlet weak var wishListPrice: UILabel!
    @IBOutlet weak var wishListColor: UILabel!
    @IBOutlet weak var wishListSize: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
