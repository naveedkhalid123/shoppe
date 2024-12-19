//
//  ToReceiveViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.


import UIKit

class ToReceiveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var orderReceivedArr = [["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","orderNumberLbl":"Order#92287157"             ,"delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Packed","itemsNumberLbl":"3 items"],
                            ["image1":"received3","image2":"receive1","image3":"received2","image4":"received4","orderNumberLbl":"Order #92287157","delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Shipped","itemsNumberLbl":"4 items"],
                            ["image1":"received4","image2":"received3","image3":"receive1","image4":"receive1","orderNumberLbl":"Order #92287157","delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Delivered","itemsNumberLbl":"5 items"],
                            ["image1":"receive1","image2":"received4","image3":"received3","image4":"receive1","orderNumberLbl":"Order #92287157","delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Delivered","itemsNumberLbl":"6 items"],
                            ["image1":"received3","image2":"receive1","image3":"received4","image4":"receive1","orderNumberLbl":"Order #92287157","delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Delivered","itemsNumberLbl":"7 items"],
                            ["image1":"receive1","image2":"received3","image3":"receive1","image4":"received4","orderNumberLbl":"Order #92287157","delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Delivered","itemsNumberLbl":"8 items"],
                            ["image1":"received4","image2":"receive1","image3":"received3","image4":"receive1","orderNumberLbl":"Order #92287157","delieveryTypeLbl":"StandardDelivery","delieveryStatusLbl":"Delivered","itemsNumberLbl":"9 items"],
    ]
    
    @IBOutlet weak var orderTrackingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orderTrackingTableView.delegate = self
        orderTrackingTableView.dataSource = self
        orderTrackingTableView.register(UINib(nibName: "OrderTrackingTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderTrackingTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderReceivedArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTrackingTableViewCell") as!OrderTrackingTableViewCell
        cell.image1FourStack.image = UIImage(named:orderReceivedArr[indexPath.row]["image1"] ?? "" )
        cell.image2FourStack.image = UIImage(named:orderReceivedArr[indexPath.row]["image2"] ?? "" )
        cell.image3FourStack.image = UIImage(named:orderReceivedArr[indexPath.row]["image3"] ?? "" )
        cell.image4FourStack.image = UIImage(named:orderReceivedArr[indexPath.row]["image4"] ?? "" )
        cell.orderNumberLbl.text = orderReceivedArr[indexPath.row]["orderNumberLbl"]
        cell.delieveryTypeLbl.text = orderReceivedArr[indexPath.row]["delieveryTypeLbl"]
        cell.delieveryStatusLbl.text = orderReceivedArr[indexPath.row]["delieveryStatusLbl"]
        cell.itemsNumberLbl.text = orderReceivedArr[indexPath.row]["delieveryTypeLbl"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 94
        }
    
}
