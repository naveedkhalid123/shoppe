//
//  ShopViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 12/12/2024.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var categoriesButton: UIButton!
    
    
    var shopBannerArr = ["shopBanner", "shopBanner","shopBanner"]
    
    
    
    var categoriesArr = [["item1":"image1","item2":"image2","item3":"image3","item4":"image4","itemName":"Clothing","itemNumber":"109"],
                         ["item1":"image5","item2":"image6","item3":"image7","item4":"image8","itemName":"Shoes","itemNumber":"530"],
                         ["item1":"image9","item2":"image10","item3":"image11","item4":"image12","itemName":"Bags","itemNumber":"87"],
                         ["item1":"image13","item2":"image14","item3":"image15","item4":"image16","itemName":"Lingerie","itemNumber":"218"],
                         ["item1":"image17","item2":"image18","item3":"image19","item4":"image20","itemName":"Watch","itemNumber":"218"],
                         ["item1":"image21","item2":"image22","item3":"image23","item4":"image24","itemName":"Hoodies","itemNumber":"109"],]
    
    var productImgArr = ["product1","product2","product3","product4","product5","product2","product3"]
    
    var newItemsArr   = [["image":"item5","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00"],
                         ["image":"item4","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$25,00"],
                         ["image":"item5","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00"],]
    
    var flashSaleArr  = [["image":"sale1","discount":"-20%"],
                         ["image":"sale2","discount":"-20%"],
                         ["image":"sale3","discount":"-20%"],
                         ["image":"sale4","discount":"-20%"],
                         ["image":"sale5","discount":"-20%"],
                         ["image":"sale6","discount":"-20%"],
                         ["image":"sale4","discount":"-20%"],
                         ["image":"sale5","discount":"-20%"],]
    
    var popularDealsArr = [["image":"popular1","price":"1780","update":"New"],
                           ["image":"popular2","price":"1780","update":"Hot"],
                           ["image":"pouplar3","price":"1780","update":"New"],
                           ["image":"popular2","price":"1780","update":"New"],]
    
    var justForYouArr  = [["image":"foryou1","desc":"Lorem ipsum dolor sit amet consectetur","price":"$17,00"],
                          ["image":"foryou2","desc":"Lorem ipsum dolor sit amet consectetur","price":"$12,00"],
                          ["image":"foryou3","desc":"Lorem ipsum dolor sit amet consectetur","price":"$16,00"],
                          ["image":"foryou4","desc":"Lorem ipsum dolor sit amet consectetur","price":"$25,00"],
                          ["image":"foryou5","desc":"Lorem ipsum dolor sit amet consectetur","price":"$17,00"],
                          ["image":"foryou6","desc":"Lorem ipsum dolor sit amet consectetur","price":"$41,00"],]
    
    
    
    @IBOutlet weak var bannerPageControl: UIPageControl!
    @IBOutlet weak var shopTxtField: UITextField!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var shopBannerCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var newItemsCollectionView: UICollectionView!
    @IBOutlet weak var flashDealsCollectiionView: UICollectionView!
    @IBOutlet weak var mostPopularCollectionView: UICollectionView!
    @IBOutlet weak var justForYouCollectionView: UICollectionView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection View Setup
        shopBannerCollectionView.delegate = self
        shopBannerCollectionView.dataSource = self
        shopBannerCollectionView.register(UINib(nibName: "ShopBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ShopBannerCollectionViewCell")
        
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        productsCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        
        newItemsCollectionView.delegate = self
        newItemsCollectionView.dataSource = self
        newItemsCollectionView.register(UINib(nibName: "NewItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewItemsCollectionViewCell")
        
        flashDealsCollectiionView.delegate = self
        flashDealsCollectiionView.dataSource = self
        flashDealsCollectiionView.register(UINib(nibName: "FlashSaleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FlashSaleCollectionViewCell")
        
        mostPopularCollectionView.delegate = self
        mostPopularCollectionView.dataSource = self
        mostPopularCollectionView.register(UINib(nibName: "MostPopularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MostPopularCollectionViewCell")
        
        justForYouCollectionView.delegate = self
        justForYouCollectionView.dataSource = self
        justForYouCollectionView.register(UINib(nibName: "NewItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewItemsCollectionViewCell")
        
        
        // Text Field Setup
        shopTxtField.layer.cornerRadius = 18
        
        // Add padding to the text field
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: shopTxtField.frame.height))
        shopTxtField.leftView = paddingView
        shopTxtField.leftViewMode = .always
        
        
        categoriesCollectionView.dropShadow(color: .black)
        newItemsCollectionView.dropShadow(color: .black)
        flashDealsCollectiionView.dropShadow(color: .black)
        mostPopularCollectionView.dropShadow(color: .black)
        justForYouCollectionView.dropShadow(color: .black)
        
        
        // For page control
        bannerPageControl.numberOfPages = shopBannerArr.count
    }
    
    
    
    
    // MARK: - UICollectionView DataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == shopBannerCollectionView{
            return shopBannerArr.count
        } else if collectionView == categoriesCollectionView {
            return categoriesArr.count
        } else if collectionView == productsCollectionView{
            return productImgArr.count
        } else if collectionView == newItemsCollectionView{
            return newItemsArr.count
        } else if collectionView == flashDealsCollectiionView {
            return flashSaleArr.count
        } else if collectionView == mostPopularCollectionView {
            return popularDealsArr.count
        } else {
            return justForYouArr.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == shopBannerCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopBannerCollectionViewCell", for: indexPath) as! ShopBannerCollectionViewCell
            cell.shopBannerImg.image = UIImage(named: shopBannerArr[indexPath.row])
            return cell
        } else if collectionView == categoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.image1.image = UIImage(named: categoriesArr[indexPath.row] ["item1"] ?? "")
            cell.image2.image = UIImage(named: categoriesArr[indexPath.row] ["item2"] ?? "")
            cell.image3.image = UIImage(named: categoriesArr[indexPath.row] ["item3"] ?? "")
            cell.image4.image = UIImage(named: categoriesArr[indexPath.row] ["item4"] ?? "")
            cell.categoryName.text = categoriesArr[indexPath.row]["itemName"]
            cell.categoryNumbers.text = categoriesArr[indexPath.row]["itemNumber"]
            return cell
        } else if collectionView == productsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            cell.productImages.image = UIImage(named: productImgArr[indexPath.row])
            return cell
        } else if collectionView == newItemsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewItemsCollectionViewCell", for: indexPath) as! NewItemsCollectionViewCell
            cell.newItemImg.image = UIImage(named: newItemsArr[indexPath.row]["image"] ?? "")
            cell.newItemDes.text = newItemsArr[indexPath.row]["desc"]
            cell.newItemPrice.text = newItemsArr[indexPath.row]["price"]
            return cell
        } else if collectionView == flashDealsCollectiionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlashSaleCollectionViewCell", for: indexPath) as! FlashSaleCollectionViewCell
            cell.flashDealsImg.image = UIImage(named: flashSaleArr[indexPath.row]["image"] ?? "")
            cell.discountPercentageLbl.text = flashSaleArr[indexPath.row]["discount"]
            return cell
        } else if collectionView == mostPopularCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MostPopularCollectionViewCell", for: indexPath) as! MostPopularCollectionViewCell
            cell.popularDealsImg.image = UIImage(named: popularDealsArr[indexPath.row]["image"] ?? "")
            cell.priceLbl.text = popularDealsArr[indexPath.row]["price"]
            cell.updateLbl.text = popularDealsArr[indexPath.row]["update"]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewItemsCollectionViewCell", for: indexPath) as! NewItemsCollectionViewCell
            cell.newItemImg.image = UIImage(named: justForYouArr[indexPath.row]["image"] ?? "")
            cell.newItemDes.text = justForYouArr[indexPath.row]["desc"]
            cell.newItemPrice.text = justForYouArr[indexPath.row]["price"]
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == shopBannerCollectionView {
            return CGSize(width: collectionView.frame.width, height: 135)
        } else if collectionView == categoriesCollectionView {
            return CGSize(width: (collectionView.frame.width / 2) - 5, height: 192)
        } else if collectionView == productsCollectionView {
            return CGSize(width: (collectionView.frame.width / 5) - 9, height: 69)
        } else if collectionView == newItemsCollectionView {
            return CGSize(width: collectionView.frame.width/2.5, height: 204)
        } else if collectionView == flashDealsCollectiionView {
            return CGSize(width: collectionView.frame.width/3, height: 114)
        } else if collectionView == mostPopularCollectionView {
            return CGSize(width: collectionView.frame.width/3.5, height: 140)
        } else {
            return CGSize(width: (collectionView.frame.width / 2) - 5, height: 240)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Bottom spacing of 10 points
    }
    
    
    
    // scrollView page controlling function
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / shopBannerCollectionView.bounds.width)
        bannerPageControl.currentPage = currentPage
    }
    
    
    
    
    
    
    // for selecting and displaying the the view controller which is connected to the tab bar
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            if let window = UIApplication.shared.keyWindow,
               let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
                tabBarVC.selectedIndex = 2
                window.rootViewController = tabBarVC
                window.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func categoriesButtonPressed(_ sender: UIButton) {
        if let tabBarVC = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? UITabBarController {
            tabBarVC.selectedIndex = 2
    
            if let navigationController = tabBarVC.viewControllers?[2] as? UINavigationController,
               let categoriesVC = storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController") as? CategoriesViewController {
                navigationController.pushViewController(categoriesVC, animated: false)
            }
    
            if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
                window.rootViewController = tabBarVC
                window.makeKeyAndVisible()
            }
        }
    }

    
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(
                title: "Camera Not Available",
                message: "This device does not support camera functionality.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            print("Image captured successfully")
        } else {
            print("No image was selected")
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User cancelled the image picker")
        // Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }
    
}
