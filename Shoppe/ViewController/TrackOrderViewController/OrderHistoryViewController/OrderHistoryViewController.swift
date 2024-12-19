//
//  OrderHistoryViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class OrderHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var reviewItemArr = [["image":"reviewItem1","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order               #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem2","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem1","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem1","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem2","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem1","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem1","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem2","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],
                         ["image":"reviewItem1","reviewItemsDesc":"Lorem ipsum dolor sit amet consectetur.","reviewItemOrderNumber":"Order   #92287157","dateLbl":"April,06"],]
    
    

    @IBOutlet weak var historyOrderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyOrderTableView.delegate = self
        historyOrderTableView.dataSource = self
        historyOrderTableView.register(UINib(nibName: "ToReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ToReviewTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewItemArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToReviewTableViewCell") as! ToReviewTableViewCell
        cell.reviewItemsImages.image = UIImage(named: reviewItemArr[indexPath.row]["image"] ?? "")
        cell.reviewItemsDesc.text = reviewItemArr[indexPath.row]["reviewItemsDesc"]
        cell.reviewItemOrderNumber.text = reviewItemArr[indexPath.row]["reviewItemOrderNumber"]
        cell.dateLbl.text = reviewItemArr[indexPath.row]["dateLbl"]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 115
        }
    
    
    
}
