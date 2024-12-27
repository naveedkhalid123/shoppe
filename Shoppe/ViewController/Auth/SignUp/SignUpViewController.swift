
//
//  SignUpViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit
import Toast_Swift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var contactTxtField: UITextField!
    @IBOutlet weak var previewButton: UIButton!
    
    // Add a property to track password visibility state
    var isPasswordVisible = false
    
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
        if Utility.shared.isEmpty(emailTxtField.text ?? "") {
            showAlert(message: "Enter Your Email")
            return
        }
        
        if Utility.shared.isValidEmail(emailTxtField.text ?? "") {
            showAlert(message: "Email is not valid")
            return
        }
        
        if Utility.shared.isEmpty(passwordTxtField.text ?? "") {
            showAlert(message: "Enter the password")
            return
        }
        
        if passwordTxtField.text?.count ?? 0 < 6 {
            showAlert(message: "Password must be greater than 6")
            return
        }
        
        if Utility.shared.isEmpty(contactTxtField.text ?? "") {
            showAlert(message: "Enter the phone number")
            return
        }
        
        let vc = PasswordViewController(nibName: "PasswordViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func previewButtonPressed(_ sender: UIButton) {
        // Toggle password visibility
        isPasswordVisible.toggle()
        
        // Update the password text field's secure entry property based on the isPasswordVisible flag
        passwordTxtField.isSecureTextEntry = !isPasswordVisible
        
        // Optionally, change the button title or icon to reflect the state (optional)
        let buttonTitle = isPasswordVisible ? "eye.slash" : "eye.slash.fill"
        previewButton.setImage(UIImage(systemName: buttonTitle), for: .normal)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
   
}
