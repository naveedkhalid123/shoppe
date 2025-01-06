//
//  CategoryTableViewCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 03/01/2025.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var categoryImg1: UIImageView!
    @IBOutlet weak var categoryImg2: UIImageView!
    @IBOutlet weak var categoryImg3: UIImageView!
    @IBOutlet weak var categoryImg4: UIImageView!
    
    @IBOutlet weak var categoryLbl: UILabel!
    

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    @IBAction func editBtnPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
    }
    
    
}
