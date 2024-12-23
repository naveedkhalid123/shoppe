//
//  ReviewsTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 23/12/2024.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var reviewImages: UIImageView!
    @IBOutlet weak var reviewName: UILabel!
    @IBOutlet weak var reviewDesc: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
