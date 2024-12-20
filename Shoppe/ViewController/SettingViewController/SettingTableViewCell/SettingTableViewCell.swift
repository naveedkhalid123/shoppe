//
//  SettingTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var countryNamesLbl: UILabel!
    @IBOutlet weak var countryCurrencyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
