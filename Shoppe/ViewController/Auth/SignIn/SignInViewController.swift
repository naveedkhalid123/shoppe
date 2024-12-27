//
//  SignInViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit

class SignInViewController: UIViewController {
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var previewButtonPressed: UIButton!
    
    var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTxtField.layer.cornerRadius = 26
        addPadding(to: emailTxtField)
        
        passTxtField.layer.cornerRadius = 26
        addPadding(to: passTxtField)
        
    }
    
    func addPadding(to textField: UITextField) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = .always
       }

    @IBAction func cancelButtonPressed(_ sender: UIButton) {
   
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        
        let vc = RecoveryPassViewController(nibName: "RecoveryPassViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
//        
//        if Utility.shared.isEmpty(emailTxtField.text ?? ""){
//            showAlert(message: "Enter the email")
//            return
//        }
//        
//        if Utility.shared.isValidEmail(emailTxtField.text ?? ""){
//            showAlert(message: "Email is not valid")
//            return
//        }
//        
//        
//        if Utility.shared.isEmpty(passTxtField.text ?? ""){
//            showAlert(message: "Enter the password")
//            return
//        }
//        
//        if passTxtField.text?.count ?? 0 < 6{
//            showAlert(message: "Password must be greater than 6")
//            return
//        }
        
        // code for moving from nib screens to tabbar screens
        // from login to the home screen we use this code
        let story = UIStoryboard(name: "Main", bundle: nil)
        if let vc = story.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
            let navigationController = UINavigationController(rootViewController: vc)
            navigationController.isNavigationBarHidden = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func previewButtonPressed(_ sender: UIButton) {
        // Toggle password visibility
        isPasswordVisible.toggle()
        
        // Update the password text field's secure entry property based on the isPasswordVisible flag
        passTxtField.isSecureTextEntry = !isPasswordVisible
        
        // Optionally, change the button title or icon to reflect the state (optional)
        let buttonTitle = isPasswordVisible ? "eye.slash" : "eye.slash.fill"
        previewButtonPressed.setImage(UIImage(systemName: buttonTitle), for: .normal)
        
    }
    
    

}
