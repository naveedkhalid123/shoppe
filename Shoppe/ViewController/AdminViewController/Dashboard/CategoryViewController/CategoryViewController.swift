//
//  CategoryViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 03/01/2025.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
    var categoriesArr = [["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","itemsLbl":"Clothing"],
                         ["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","itemsLbl":"Shoes"],
                         ["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","itemsLbl":"Watches"],
                         ["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","itemsLbl":"Bags"],
                         ["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","itemsLbl":"Clothing"],
                         ["image1":"receive1","image2":"received2","image3":"received3","image4":"received4","itemsLbl":"Clothing"],]
    
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var uploadBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadBtn.layer.cornerRadius = 10
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
        cell.categoryImg1.image = UIImage(named:categoriesArr[indexPath.row] ["image1"] ?? "" )
        cell.categoryImg2.image = UIImage(named:categoriesArr[indexPath.row] ["image2"] ?? "" )
        cell.categoryImg3.image = UIImage(named:categoriesArr[indexPath.row] ["image3"] ?? "" )
        cell.categoryImg4.image = UIImage(named:categoriesArr[indexPath.row] ["image4"] ?? "" )
        cell.categoryLbl.text = categoriesArr[indexPath.row]["itemsLbl"]
        
        cell.deleteBtn.addTarget(self, action: #selector(deleteButtonPressed(_:)), for: .touchUpInside)
        cell.deleteBtn.tag = indexPath.row
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 94
        }
    
    
    
    @IBAction func uploadCategoriesBtnPressed(_ sender: UIButton) {
        
        let vc = ProductsUpload(nibName: "ProductsUpload", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @objc func deleteButtonPressed(_ sender: UIButton) {
        
        FirebaseAuth.shared.deleteCategory(at: sender.tag) { success, error in
            if success {
//                // Update your local data source and UI
//                self.categories.remove(at: indexPath.row)
//                self.categoryTableView.deleteRows(at: [indexPath], with: .fade)
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
