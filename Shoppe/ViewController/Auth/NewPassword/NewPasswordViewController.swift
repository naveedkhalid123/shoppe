//
//  NewPasswordViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 11/12/2024.
//

import UIKit

class NewPasswordViewController: UIViewController {
    
    
    
    @IBOutlet weak var newPasswordTxtField: UITextField!
    @IBOutlet weak var repeatPasswordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        newPasswordTxtField.layer.cornerRadius = 9
        repeatPasswordTxtField.layer.cornerRadius = 9
    }

}
