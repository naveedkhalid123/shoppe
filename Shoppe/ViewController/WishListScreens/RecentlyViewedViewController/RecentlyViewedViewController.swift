//
//  RecentlyViewedViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 16/12/2024.
//

import UIKit

class RecentlyViewedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    var selectedDayArr = ["Today","Today"]
    var unSelectedDayArr = ["Yesterday","Yesterday"]
    var recentlyViewedArr = [["image":"foryou1","desc":"Lorem ipsum dolor sit amet consectetur","price":"$17,00"],
                            ["image":"foryou2","desc":"Lorem ipsum dolor sit amet consectetur","price":"$12,00"],
                            ["image":"foryou3","desc":"Lorem ipsum dolor sit amet consectetur","price":"$16,00"],
                            ["image":"foryou4","desc":"Lorem ipsum dolor sit amet consectetur","price":"$25,00"],
                            ["image":"foryou5","desc":"Lorem ipsum dolor sit amet consectetur","price":"$17,00"],
                            ["image":"foryou6","desc":"Lorem ipsum dolor sit amet consectetur","price":"$41,00"],
                             ["image":"foryou5","desc":"Lorem ipsum dolor sit amet consectetur","price":"$17,00"],
                             ["image":"foryou6","desc":"Lorem ipsum dolor sit amet consectetur","price":"$41,00"],]
   
    
    @IBOutlet weak var dayCollectionView: UICollectionView!
    @IBOutlet weak var recentlyViewesCollectionView: UICollectionView!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayCollectionView.delegate = self
        dayCollectionView.dataSource = self
        dayCollectionView.register(UINib(nibName: "DayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DayCollectionViewCell")
        
        recentlyViewesCollectionView.delegate = self
        recentlyViewesCollectionView.dataSource = self
        recentlyViewesCollectionView.register(UINib(nibName: "NewItemsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewItemsCollectionViewCell")
        
        
        
        datePickerView.dropShadow(color: .black)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == dayCollectionView {
            return unSelectedDayArr.count
        } else {
            return recentlyViewedArr.count
        }
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == dayCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCollectionViewCell", for: indexPath) as! DayCollectionViewCell
            cell.unselectedLbl.text = unSelectedDayArr[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewItemsCollectionViewCell", for: indexPath) as! NewItemsCollectionViewCell
            cell.newItemImg.image = UIImage(named: recentlyViewedArr[indexPath.row]["image"] ?? "")
            cell.newItemDes.text = recentlyViewedArr[indexPath.row]["desc"]
            cell.newItemPrice.text = recentlyViewedArr[indexPath.row]["price"]
            return cell
        }
       
      
    }
     
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == dayCollectionView {
            return CGSize(width: collectionView.frame.width/2, height: 30)
        } else {
            return CGSize(width: (collectionView.frame.width / 2) - 5, height: 240)
        }
    
    }
    
    @IBAction func datePickerButtonPresses(_ sender: UIButton) {
        self.datePickerView.alpha = 0.0
        self.datePickerView.isHidden = false
        UIView.animate(withDuration: 1.0) {
            self.datePickerView.alpha = 1.0
            self.datePickerView.layoutIfNeeded()
        }
    }
    
    
    @IBAction func datepickerCloseButtonPressed(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, animations: {
            self.datePickerView.alpha = 0.0
        }) { _ in
            self.datePickerView.isHidden = true
        }
    }
    
    
}
