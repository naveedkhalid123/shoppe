//
//  SignInViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTxtField.layer.cornerRadius = 26
        addPadding(to: emailTxtField)
    }
    
    func addPadding(to textField: UITextField) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = .always
       }

}
