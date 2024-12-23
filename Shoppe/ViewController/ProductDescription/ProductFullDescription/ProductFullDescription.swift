
//  ProductFullDescription.swift
//  Shoppe
//
//  Created by Naveed Khalid on 21/12/2024.
//

import UIKit

class ProductFullDescription: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    var fullProductArr = ["fullProduct1", "fullProduct1", "fullProduct1"]
    var variationImagesArr = ["variation1", "variation2", "variation3"]
    var materialsArr = ["Cotton 95%", "Nylon 5%", "Cotton 95%", "Nylon 5%", "Cotton 95%", "Nylon 5%"]
    var originArr = ["EU", "US", "AUS", "EU", "EU", "EU", "EU", "EU", "EU", "EU", "EU", "EU", "EU"]
    var deliveryDetailsArr = [["deliveryTypeLbl": "Standard", "deliveryDaysLbl": "5-7 days", "deliveryPriceLbl": "$3,00"],
                             ["deliveryTypeLbl": "Express", "deliveryDaysLbl": "2-3 days", "deliveryPriceLbl": "$5,00"]]
    
    var reviewsDetailsArr = [["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy   eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed ..."],["reviewImages":"reviewImg","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy   eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed ..."],]
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var variationsCollectionView: UICollectionView!
    @IBOutlet weak var materialsCollectionView: UICollectionView!
    @IBOutlet weak var originCollectionView: UICollectionView!
    
    @IBOutlet weak var deliveryTableViewCell: UITableView!
    @IBOutlet weak var reviewsTableView: UITableView!
    
    
    @IBOutlet weak var viewAllReviewsButton: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        variationsCollectionView.delegate = self
        variationsCollectionView.dataSource = self
        variationsCollectionView.register(UINib(nibName: "VariationsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VariationsCollectionViewCell")
        
        materialsCollectionView.delegate = self
        materialsCollectionView.dataSource = self
        materialsCollectionView.register(UINib(nibName: "MaterialCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MaterialCollectionViewCell")
        
        originCollectionView.delegate = self
        originCollectionView.dataSource = self
        originCollectionView.register(UINib(nibName: "OriginCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OriginCollectionViewCell")
        
        deliveryTableViewCell.delegate = self
        deliveryTableViewCell.dataSource = self
        deliveryTableViewCell.register(UINib(nibName: "DeliveryTableViewCell", bundle: nil), forCellReuseIdentifier: "DeliveryTableViewCell")
        deliveryTableViewCell.rowHeight = 50
        
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
        reviewsTableView.register(UINib(nibName: "ReviewsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewsTableViewCell")
        reviewsTableView.rowHeight = 108
        
        
        viewAllReviewsButton.layer.cornerRadius = 11
                
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return fullProductArr.count
        } else if collectionView == variationsCollectionView {
            return variationImagesArr.count
        } else if collectionView == materialsCollectionView {
            return materialsArr.count
        } else {
            return originArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            cell.fullProductImage.image = UIImage(named: fullProductArr[indexPath.row])
            return cell
        } else if collectionView == variationsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VariationsCollectionViewCell", for: indexPath) as! VariationsCollectionViewCell
            cell.variationImages.image = UIImage(named: variationImagesArr[indexPath.row])
            return cell
        } else if collectionView == materialsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaterialCollectionViewCell", for: indexPath) as! MaterialCollectionViewCell
            cell.materialLbl.text = materialsArr[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OriginCollectionViewCell", for: indexPath) as! OriginCollectionViewCell
            cell.originLbl.text = originArr[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollectionView {
            return CGSize(width: collectionView.frame.width, height: 439)
        } else if collectionView == variationsCollectionView {
            return CGSize(width: (collectionView.frame.width / 4.5) - 6, height: 75)
        } else if collectionView == materialsCollectionView {
            return CGSize(width: (collectionView.frame.width / 3) - 6, height: 25)
        } else {
            return CGSize(width: (collectionView.frame.width / 4) - 6, height: 25)
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == deliveryTableViewCell{
            return deliveryDetailsArr.count
        } else {
            return reviewsDetailsArr.count
        }
     
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == deliveryTableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTableViewCell", for: indexPath) as! DeliveryTableViewCell
            cell.deliveryTypeLbl.text = deliveryDetailsArr[indexPath.row]["deliveryTypeLbl"]
            cell.deliveryDaysLbl.text = deliveryDetailsArr[indexPath.row]["deliveryDaysLbl"]
            cell.deliveryPriceLbl.text = deliveryDetailsArr[indexPath.row]["deliveryPriceLbl"]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
            cell.reviewImages.image = UIImage(named:reviewsDetailsArr[indexPath.row]["reviewImages"] ?? "" )
            cell.reviewName.text = reviewsDetailsArr[indexPath.row]["reviewName"]
            cell.reviewDesc.text = reviewsDetailsArr[indexPath.row]["reviewDesc"]
            return cell
        }
     
    }
    
    
}
