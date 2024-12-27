//
//  SettingViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var setttingArr = [["countryNamesLbl":"Profile","countryCurrencyLbl":""],
                       ["countryNamesLbl":"Shipping Address","countryCurrencyLbl":""],
                       ["countryNamesLbl":"Payment methods","countryCurrencyLbl":""],
                       ["countryNamesLbl":"Country","countryCurrencyLbl":"Vietnam"],
                       ["countryNamesLbl":"Currency","countryCurrencyLbl":"$ USD"],
                       ["countryNamesLbl":"Sizes","countryCurrencyLbl":"UK"],
                       ["countryNamesLbl":"Terms and Conditions","countryCurrencyLbl":""],
                       ["countryNamesLbl":"Language","countryCurrencyLbl":"English"],
                       ["countryNamesLbl":"About Slada","countryCurrencyLbl":""],]
    
    
    @IBOutlet weak var settingTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setttingArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
        cell.countryNamesLbl.text = setttingArr[indexPath.row]["countryNamesLbl"]
        cell.countryCurrencyLbl.text = setttingArr[indexPath.row]["countryCurrencyLbl"]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 52
        }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = SettingProfileViewController(nibName: "SettingProfileViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ShippingAddressViewController(nibName: "ShippingAddressViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = PaymentMethodViewController(nibName: "PaymentMethodViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ChooseCountryViewController(nibName: "ChooseCountryViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ChooseCountryViewController(nibName: "ChooseCountryViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ChooseCountryViewController(nibName: "ChooseCountryViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = AboutViewController(nibName: "AboutViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ChooseLanguageViewController(nibName: "ChooseLanguageViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = AboutViewController(nibName: "AboutViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func deleteAccountButtonPressed(_ sender: UIButton) {
        
            let vc = DeleteAccountViewController(nibName: "DeleteAccountViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

