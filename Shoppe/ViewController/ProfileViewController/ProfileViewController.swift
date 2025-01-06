//
//  ProfileViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 17/12/2024.
//
import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIAdaptivePresentationControllerDelegate{
    
    
    
    
    
    var productImgArr = ["product1","product2","product3","product4","product5","product2","product3"]
    var orderStatusArr = ["To Pay","To Recieve","To Review","To Recieve","To Review",]
    var storiesArr = ["stories3","stories3","stories3","stories3","stories3","stories3",]
    
    
    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var recentlyViewedCollectionView: UICollectionView!
    @IBOutlet weak var myOrdersCollectionView: UICollectionView!
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityButton.layer.cornerRadius = 18
        
        recentlyViewedCollectionView.delegate = self
        recentlyViewedCollectionView.dataSource = self
        recentlyViewedCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        
        myOrdersCollectionView.delegate = self
        myOrdersCollectionView.dataSource = self
        myOrdersCollectionView.register(UINib(nibName: "OrderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OrderCollectionViewCell")
         
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        storiesCollectionView.register(UINib(nibName: "StoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoriesCollectionViewCell")

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recentlyViewedCollectionView {
            return productImgArr.count
        } else  if collectionView == myOrdersCollectionView {
            return orderStatusArr.count
        } else {
            return storiesArr.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recentlyViewedCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            cell.productImages.image = UIImage(named: productImgArr[indexPath.row])
            return cell
        } else  if collectionView == myOrdersCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCollectionViewCell", for: indexPath) as! OrderCollectionViewCell
            cell.orderStatusLbl.text = productImgArr[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as! StoriesCollectionViewCell
            cell.storyImages.image = UIImage(named: storiesArr[indexPath.row])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recentlyViewedCollectionView {
            return CGSize(width: (collectionView.frame.width / 5) - 9, height: 69)
        }else if  collectionView == myOrdersCollectionView {
            return CGSize(width: (collectionView.frame.width / 3) - 9, height: 35)
        } else {
            return CGSize(width: (collectionView.frame.width / 3) - 6, height: 175)
        }
    }
    
    
    
    // MARK: - Blur Effect
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.tag = 10
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.7
        self.view.addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        if let blurEffectView = self.view.viewWithTag(10) {
            blurEffectView.removeFromSuperview()
        }
    }
    
    
    
    @IBAction func vouchersButtonPressed(_ sender: UIButton) {
        self.addBlurEffect()

        let vc = VoucherViewController(nibName: "VoucherViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc, animated: true)
    }
    
    
    @IBAction func settingButtonPressed(_ sender: UIButton) {
    
        let vc = SettingViewController(nibName: "SettingViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

