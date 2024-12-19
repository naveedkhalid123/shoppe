//
//  ToReviewTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class ToReviewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var reviewButton: UIButton!
    @IBOutlet weak var dateView: UIView!
    
    @IBOutlet weak var reviewItemsDesc: UILabel!
    @IBOutlet weak var reviewItemsImages: UIImageView!
    @IBOutlet weak var reviewItemOrderNumber: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateView.layer.cornerRadius = 9
        reviewButton.layer.borderColor = UIColor(named: "theme")?.cgColor
        reviewButton.layer.borderWidth = 1
        reviewButton.layer.cornerRadius = 9
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
