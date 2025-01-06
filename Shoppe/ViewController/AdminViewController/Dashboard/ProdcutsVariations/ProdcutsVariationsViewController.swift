//
//  ProdcutsVariationsViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 06/01/2025.
//

import UIKit

class ProdcutsVariationsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var productsArr = [["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","name":"Shoes","price":"$12"],]
    
    @IBOutlet weak var prodcutsVariation: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodcutsVariation.delegate =  self
        prodcutsVariation.dataSource = self
        prodcutsVariation.register(UINib(nibName: "ProductsVariationsCell", bundle: nil), forCellReuseIdentifier: "ProductsVariationsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsVariationsCell") as! ProductsVariationsCell
        cell.productImage1.image = UIImage(named: productsArr[indexPath.row]["image1"] ?? "")
        cell.productImage2.image = UIImage(named: productsArr[indexPath.row]["image2"] ?? "")
        cell.productImage3.image = UIImage(named: productsArr[indexPath.row]["image3"] ?? "")
        cell.productImage4.image = UIImage(named: productsArr[indexPath.row]["image4"] ?? "")
        cell.productName.text = productsArr[indexPath.row]["name"]
        cell.productPrice.text = productsArr[indexPath.row]["price"]
        
        //  we added deleted action on the delete button , then the action will perform on selected table view cell and it will delete, that why we use tag here.
        cell.deleteBtn.addTarget(self, action: #selector(deleteButtonPressed(_:)), for: .touchUpInside)
        cell.deleteBtn.tag = indexPath.row
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    
    @objc func deleteButtonPressed(_ sender: UIButton) {
        FirebaseAuth.shared.deleteCategory(at: sender.tag) { success, error in
            if success {

            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
    
    
    

