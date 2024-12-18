//
//  VouchersTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 18/12/2024.
//

import UIKit

class VouchersTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var validUptoLbl: UILabel!
    @IBOutlet weak var voucherCategoryLbl: UILabel!
    @IBOutlet weak var discountDesLbl: UILabel!
    @IBOutlet weak var voucherView: UIView!
    @IBOutlet weak var applyButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        voucherView.layer.borderColor = UIColor(named: "theme")?.cgColor
        voucherView.layer.borderWidth = 1.0
        voucherView.layer.cornerRadius = 8.0
        voucherView.clipsToBounds = true
        
        applyButton.layer.cornerRadius = 6
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
