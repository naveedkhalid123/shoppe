//
//  ProdcutReviewsViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 23/12/2024.
//

import UIKit

class ProdcutReviewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var reviewsDetailsArr = [["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy  eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy   eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],
                             ["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],
                             ["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],
                             ["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],
                             ["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],
                             ["reviewImages":"reviewImage2","reviewName":"Veronika","reviewDesc":"Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum"],]
 
    
    @IBOutlet weak var reviewsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
        reviewsTableView.register(UINib(nibName: "ReviewsTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewsTableViewCell")
        
        // automatic height for adjusting the content automatically
        reviewsTableView.rowHeight = UITableView.automaticDimension
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return reviewsDetailsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as! ReviewsTableViewCell
        cell.reviewImages.image = UIImage(named:reviewsDetailsArr[indexPath.row]["reviewImages"] ?? "" )
        cell.reviewName.text = reviewsDetailsArr[indexPath.row]["reviewName"]
        cell.reviewDesc.text = reviewsDetailsArr[indexPath.row]["reviewDesc"]
        return cell
        }
    }

