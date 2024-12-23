//
//  SignUpViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var contactTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.layer.cornerRadius = 26
        passwordTxtField.layer.cornerRadius = 26
        
        
        addPadding(to: emailTxtField)
        addPadding(to: passwordTxtField)
        addPadding(to: contactTxtField)
        
    }
    
    func addPadding(to textField: UITextField) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = .always
       }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        let vc = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController( animated: true)

    }
    
    
}
