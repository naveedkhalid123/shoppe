//
//  DeliveredOrderViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class DeliveredOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var  orderDelieveryStatusArr = [["orderStatus":"Packed","orderDescription":"Your parcel is packed and will be handed over to our delivery partner.Your parcel is packed and will be handed over to our deliveryYour parcel is packed and will be handed over to our delivery","orderTimeAndDate":"April,19 12:31"],
                                    ["orderStatus":"On the Way to Logistic Facility","orderDescription":"Your parcel is packed and will be handed over to our deliverypartner.","orderTimeAndDate":"April,19 12:31"],
                                    ["orderStatus":"Arrived at Logistic Facility","orderDescription":"Your parcel is packed and will be handed over to our delivery partner.","orderTimeAndDate":"April,19 16:20"],
                                    ["orderStatus":"Shipped","orderDescription":"Your parcel is packed and will be handed over to our delivery partner.","orderTimeAndDate":"April,19 19:07"],
                                    ["orderStatus":"Out for Delivery","orderDescription":"Your parcel is packed and will be handed over to our delivery partner.","orderTimeAndDate":"April,22 11:10"],]
                                  
    
    
    @IBOutlet weak var trackingOrderTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackingOrderTableView.delegate = self
        trackingOrderTableView.dataSource = self
        trackingOrderTableView.register(UINib(nibName: "TrackingOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "TrackingOrderTableViewCell")
        trackingOrderTableView.rowHeight = UITableView.automaticDimension
        trackingOrderTableView.estimatedRowHeight = 82

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderDelieveryStatusArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackingOrderTableViewCell") as!TrackingOrderTableViewCell
        cell.orderStatus.text = orderDelieveryStatusArr[indexPath.row]["orderStatus"]
        cell.orderDescription.text = orderDelieveryStatusArr[indexPath.row]["orderDescription"]
        cell.orderTimeAndDate.text = orderDelieveryStatusArr[indexPath.row]["orderTimeAndDate"]
        
        return cell
    }
    

}
