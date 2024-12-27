
//
//  PaymentHistoryViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class PaymentHistoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {


    var paymentHistoryArr = [["paymentDateLbl": "April, 19 2020 12:31", "orderNumberLbl": "Order #92287157", "orderPriceLbl": "-$14.00"],
                             ["paymentDateLbl": "May, 15 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$37,00"],
                             ["paymentDateLbl": "May, 16 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$23.00"],
                             ["paymentDateLbl": "May, 17 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$54.00"],
                             ["paymentDateLbl": "May, 17 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$11.00"],
                             ["paymentDateLbl": "May, 18 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$20.00"],
                             ["paymentDateLbl": "May, 19 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$45.00"],
                             ["paymentDateLbl": "May, 19 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$30.00"],
                             ["paymentDateLbl": "May, 20 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$12.00"],
                             ["paymentDateLbl": "May, 21 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$56.00"],
                             ["paymentDateLbl": "May, 22 2020 14:15", "orderNumberLbl": "Order #12345678", "orderPriceLbl": "-$10.00"],]
    
    var paymentCardArr = ["Card", "Card"]
    
 
    @IBOutlet weak var paymentMethodCardCollectionView: UICollectionView!
    @IBOutlet weak var paymentHistoryTableView: UITableView!
    @IBOutlet weak var addCardButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentMethodCardCollectionView.delegate = self
        paymentMethodCardCollectionView.dataSource = self
        paymentMethodCardCollectionView.register(UINib(nibName: "PaymentMethodCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "PaymentMethodCollectionViewCell")
        
        paymentHistoryTableView.delegate = self
        paymentHistoryTableView.dataSource = self
        paymentHistoryTableView.register(UINib(nibName: "PaymentHistoryTableViewCell", bundle: nil),forCellReuseIdentifier: "PaymentHistoryTableViewCell")
        
        addCardButton.layer.cornerRadius = 4
    }
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentCardArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentMethodCollectionViewCell", for: indexPath) as? PaymentMethodCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 155)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentHistoryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentHistoryTableViewCell", for: indexPath) as? PaymentHistoryTableViewCell else {
            return UITableViewCell()
        }
        
        let paymentData = paymentHistoryArr[indexPath.row]
        cell.paymentDateLbl.text = paymentData["paymentDateLbl"]
        cell.orderNumberLbl.text = paymentData["orderNumberLbl"]
        cell.orderPriceLbl.text = paymentData["orderPriceLbl"]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}
