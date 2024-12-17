//
//  AddCartTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 16/12/2024.
//

import UIKit

class AddCartTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cartImg: UIImageView!
    @IBOutlet weak var cartDesc: UILabel!
    @IBOutlet weak var cartColorAndSize: UILabel!
    @IBOutlet weak var cartPrice: UILabel!
    @IBOutlet weak var cartItemCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
