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
  
    @IBOutlet weak var wishListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
        wishListTableView.register(UINib(nibName: "WishListTableViewCell", bundle: nil), forCellReuseIdentifier: "WishListTableViewCell")
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

