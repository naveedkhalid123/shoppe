//
//  CartViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 16/12/2024.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var wishListArr = [["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur .","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list2","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list3","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list4","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],
                       ["image":"list1","desc":"Lorem ipsum dolor sit amet consectetur.","price":"$17,00","color":"Pink","size":"M"],]
    
    
    var cartItemsArr = [["image":"cart1","cartDesc":"Lorem ipsum dolor sit amet consectetur.","cartColorAndSize":"Pink, Size M","price":"$17,00"],
                        ["image":"list4","cartDesc":"Lorem ipsum dolor sit amet consectetur.","cartColorAndSize":"Pink, Size M","price":"$17,00"],]
    
    
  
    
    @IBOutlet weak var editShippingAddress: UIButton!
    
    @IBOutlet weak var wishListTableView: UITableView!
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var cartTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var wishListTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var checkoutButton: UIButton!
    var checkoutButtonSelected = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
        wishListTableView.register(UINib(nibName: "WishListTableViewCell", bundle: nil), forCellReuseIdentifier: "WishListTableViewCell")
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(UINib(nibName: "AddCartTableViewCell", bundle: nil), forCellReuseIdentifier: "AddCartTableViewCell")
        wishListTableView.rowHeight = 109
        cartTableView.rowHeight = 109
       
        wishListTableViewHeight.constant = CGFloat(wishListArr.count * 109)
        cartTableViewHeight.constant = CGFloat(cartItemsArr.count * 109)
        
        
    }
    
    
    @IBAction func editShippingAddressBtnPressed(_ sender: UIButton) {
        let vc = EditShippingAddressViewController(nibName: "EditShippingAddressViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    
    
    @IBAction func checkoutButtonPressed(_ sender: UIButton) {
        if checkoutButtonSelected == true {
            // Update button appearance
            checkoutButton.layer.backgroundColor = UIColor(named: "theme")?.cgColor
            checkoutButton.setTitleColor(.white, for: .normal)
            
            // Navigate to PaymentViewController using Nib
            let paymentVC = PaymentViewController(nibName: "PaymentViewController", bundle: nil)
            self.navigationController?.pushViewController(paymentVC, animated: true)
        } else {
            // Update button appearance
            checkoutButton.layer.backgroundColor = UIColor(named: "Bg grey")?.cgColor
            checkoutButton.setTitleColor(.black, for: .normal)
        }
    }



    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == wishListTableView {
            return wishListArr.count
        } else {
            return cartItemsArr.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == wishListTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "WishListTableViewCell", for: indexPath) as! WishListTableViewCell
            cell.wishListImages.image = UIImage(named: wishListArr[indexPath.row]["image"] ?? "")
            cell.wishListDesc.text = wishListArr[indexPath.row]["desc"]
            cell.wishListPrice.text = wishListArr[indexPath.row]["price"]
            cell.wishListColor.text = wishListArr[indexPath.row]["color"]
            cell.wishListSize.text = wishListArr[indexPath.row]["size"]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCartTableViewCell", for: indexPath) as! AddCartTableViewCell
            cell.cartImg.image = UIImage(named: cartItemsArr[indexPath.row]["image"] ?? "")
            cell.cartDesc.text = cartItemsArr[indexPath.row]["cartDesc"]
            cell.cartColorAndSize.text = cartItemsArr[indexPath.row]["cartColorAndSize"]
            cell.cartPrice.text = cartItemsArr[indexPath.row]["price"]
            return cell
        }
      
    }
    
}

