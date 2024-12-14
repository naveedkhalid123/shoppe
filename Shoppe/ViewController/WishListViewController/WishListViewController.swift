////
////  WishListViewController.swift
////  Shoppe
////
////  Created by Naveed Khalid on 14/12/2024.
////
//
//import UIKit
//
//class WishListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource{
//
//
//    var productImgArr = ["product1","product2","product3","product4","product5","product2","product3"]
//    var popularDealsArr = [["image":"popular1","price":"1780","update":"New"],
//                          ["image":"popular2","price":"1780","update":"Hot"],
//                          ["image":"pouplar3","price":"1780","update":"New"],
//                          ["image":"popular2","price":"1780","update":"New"],]
//
//
//    @IBOutlet weak var topProductsCollectionView: UICollectionView!
//    @IBOutlet weak var mostPopularCollectionView: UICollectionView!
//    @IBOutlet weak var mostPopulatTableView: UITableView!
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        topProductsCollectionView.delegate = self
//        topProductsCollectionView.dataSource = self
//        topProductsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
//
//        mostPopularCollectionView.delegate = self
//        mostPopularCollectionView.dataSource = self
//        mostPopularCollectionView.register(UINib(nibName: "MostPopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MostPopularCollectionViewCell")
//
//        mostPopulatTableView.delegate = self
//        mostPopulatTableView.dataSource = self
//        mostPopulatTableView.register(UINib(nibName: "WishListTableViewCell", bundle: nil), forCellWithReuseIdentifier: "WishListTableViewCell")
//    }
//
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == topProductsCollectionView {
//            return productImgArr.count
//        } else {
//            return popularDealsArr.count
//        }
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if collectionView == topProductsCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
//            cell.productImages.image = UIImage(named: productImgArr[indexPath.row])
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostPopularCollectionViewCell", for: indexPath) as! MostPopularCollectionViewCell
//            cell.popularDealsImg.image = UIImage(named: popularDealsArr[indexPath.row]["image"] ?? "")
//            cell.priceLbl.text = popularDealsArr[indexPath.row]["price"]
//            cell.updateLbl.text = popularDealsArr[indexPath.row]["update"]
//            return cell
//        }
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == topProductsCollectionView {
//            return CGSize(width: collectionView.frame.width / 5 - 14, height: 60)
//        } else {
//            return CGSize(width: (collectionView.frame.width / 3.5) - 6, height: 140)
//        }
//
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//
//}
//






//
//  WishListViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 14/12/2024.
//

import UIKit

class WishListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    var productImgArr = ["product1","product2","product3","product4","product5","product2","product3"]
    var popularDealsArr = [["image":"popular1","price":"1780","update":"New"],
                          ["image":"popular2","price":"1780","update":"Hot"],
                          ["image":"pouplar3","price":"1780","update":"New"],
                          ["image":"popular2","price":"1780","update":"New"]]
    
    var wishListArr = [["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur consectetur consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],]

    @IBOutlet weak var topProductsCollectionView: UICollectionView!
    @IBOutlet weak var mostPopularCollectionView: UICollectionView!
    @IBOutlet weak var mostPopulatTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection View Setup
        topProductsCollectionView.delegate = self
        topProductsCollectionView.dataSource = self
        topProductsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")

        mostPopularCollectionView.delegate = self
        mostPopularCollectionView.dataSource = self
        mostPopularCollectionView.register(UINib(nibName: "MostPopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MostPopularCollectionViewCell")

        // Table View Setup
        mostPopulatTableView.delegate = self
        mostPopulatTableView.dataSource = self
        mostPopulatTableView.register(UINib(nibName: "WishListTableViewCell", bundle: nil), forCellReuseIdentifier: "WishListTableViewCell")
        
        mostPopulatTableView.rowHeight = 123
    }

 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topProductsCollectionView {
            return productImgArr.count
        } else {
            return popularDealsArr.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topProductsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            cell.productImages.image = UIImage(named: productImgArr[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostPopularCollectionViewCell", for: indexPath) as! MostPopularCollectionViewCell
            cell.popularDealsImg.image = UIImage(named: popularDealsArr[indexPath.row]["image"] ?? "")
            cell.priceLbl.text = popularDealsArr[indexPath.row]["price"]
            cell.updateLbl.text = popularDealsArr[indexPath.row]["update"]
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == topProductsCollectionView {
            return CGSize(width: collectionView.frame.width / 5 - 14, height: 60)
        } else {
            return CGSize(width: (collectionView.frame.width / 3.5) - 6, height: 140)
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishListArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishListTableViewCell", for: indexPath) as! WishListTableViewCell
        cell.wishListImages.image = UIImage(named: wishListArr[indexPath.row]["image"] ?? "")
        cell.wishListDesc.text = wishListArr[indexPath.row]["desc"]
        cell.wishListPrice.text = wishListArr[indexPath.row]["price"]
        cell.wishListColor.text = wishListArr[indexPath.row]["color"]
        cell.wishListSize.text = wishListArr[indexPath.row]["size"]
        return cell
    }
}
