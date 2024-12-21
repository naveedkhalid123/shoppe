//
//  ProductFullDescription.swift
//  Shoppe
//
//  Created by Naveed Khalid on 21/12/2024.
//

import UIKit

class ProductFullDescription: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    
    var fullProductArr = ["fullProduct1","fullProduct1","fullProduct1"]
    var variationImagesArr = ["variation1","variation2","variation3"]
    
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var variationsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        
        variationsCollectionView.delegate = self
        variationsCollectionView.dataSource = self
        variationsCollectionView.register(UINib(nibName: "VariationsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "VariationsCollectionViewCell")


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == productCollectionView {
            return fullProductArr.count

        } else {
            return variationImagesArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == productCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            cell.fullProductImage.image = UIImage(named: fullProductArr[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VariationsCollectionViewCell", for: indexPath) as! VariationsCollectionViewCell
            cell.variationImages.image = UIImage(named: variationImagesArr[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == productCollectionView {
            return CGSize(width: collectionView.frame.width, height: 439)
        } else {
            return CGSize(width: (collectionView.frame.width / 4.5) - 6, height: 75)

        }

    }
}
