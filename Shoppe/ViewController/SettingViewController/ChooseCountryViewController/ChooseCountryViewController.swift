////
////  ChooseCountryViewController.swift
////  Shoppe
////
////  Created by Naveed Khalid on 21/12/2024.
////
//
//import UIKit
//
//class ChooseCountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var countriesArr = ["Afghanistan","Albania","Algeria","Andorra","Angola","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan"]
//
//    @IBOutlet weak var countryTableView: UITableView!
//    @IBOutlet weak var countrySearchField: UISearchBar!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        countryTableView.delegate = self
//        countryTableView.dataSource = self
//        countryTableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return countriesArr.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
//        cell.countryLbl.text = countriesArr[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 52
//        }
//
//
//}

//
//  ChooseCountryViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 21/12/2024.
//

import UIKit

class ChooseCountryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var countriesArr = ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan"]
    
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var countrySearchField: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        if let textField = countrySearchField.value(forKey: "searchField") as? UITextField {
               textField.backgroundColor = UIColor(named: "Light blue")
               textField.layer.cornerRadius = 9
               textField.clipsToBounds = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        cell.countryLbl.text = countriesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}
