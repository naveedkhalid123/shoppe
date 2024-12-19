//
//  OrderTrackingTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class OrderTrackingTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var foutImagesStackView: UIStackView!
    @IBOutlet weak var twoImagesStackView: UIStackView!
    @IBOutlet weak var singleImageStackView: UIStackView!
    
    
    @IBOutlet weak var image1FourStack: UIImageView!
    @IBOutlet weak var image2FourStack: UIImageView!
    @IBOutlet weak var image3FourStack: UIImageView!
    @IBOutlet weak var image4FourStack: UIImageView!
    
    
    @IBOutlet weak var image1TwoStack: UIImageView!
    @IBOutlet weak var image2TwoStack: UIImageView!
    @IBOutlet weak var image1SingleStack: UIImageView!
    
    @IBOutlet weak var orderNumberLbl: UILabel!
    @IBOutlet weak var delieveryTypeLbl: UILabel!
    @IBOutlet weak var delieveryStatusLbl: UILabel!
    @IBOutlet weak var itemsNumberLbl: UILabel!
    
    @IBOutlet weak var trackButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackButton.layer.cornerRadius = 9
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
