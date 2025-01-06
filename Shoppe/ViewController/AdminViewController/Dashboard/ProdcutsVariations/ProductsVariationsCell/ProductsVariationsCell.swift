//
//  ProductsVariationsCell.swift
//  Shoppe
//
//  Created by Naveed Khalid on 06/01/2025.
//

import UIKit

class ProductsVariationsCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    var productSizeArr = ["S","M","L"]
    
    var productColorArr = ["Pink","Black","Red"]
    
    @IBOutlet weak var productImage1: UIImageView!
    @IBOutlet weak var productImage2: UIImageView!
    @IBOutlet weak var productImage3: UIImageView!
    @IBOutlet weak var productImage4: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    @IBOutlet weak var productSizeCollectionView: UICollectionView!
    @IBOutlet weak var productColorCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productSizeCollectionView.delegate = self
        productSizeCollectionView.dataSource = self
        productSizeCollectionView.register(UINib(nibName: "ProductSizeCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductSizeCellCollectionViewCell")
        
        
        productColorCollectionView.delegate = self
        productColorCollectionView.dataSource = self
        productColorCollectionView.register(UINib(nibName: "ProductsColorCell", bundle: nil), forCellWithReuseIdentifier: "ProductsColorCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productSizeCollectionView {
            return productSizeArr.count
        } else {
            return productColorArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productSizeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSizeCellCollectionViewCell", for: indexPath) as! ProductSizeCellCollectionViewCell
            cell.sizeLbl.text = productSizeArr[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsColorCell", for: indexPath) as! ProductsColorCell
            cell.colorLbl.text = productColorArr[indexPath.row]
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productSizeCollectionView {
            return CGSize(width: collectionView.frame.width/5, height: 20)
        } else {
            return CGSize(width: collectionView.frame.width/5, height: 20)
        }
     
    }

    
    
    
    @IBAction func editBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
