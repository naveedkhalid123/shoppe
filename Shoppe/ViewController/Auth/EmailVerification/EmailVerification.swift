//
//  EmailVerification.swift
//  Shoppe
//
//  Created by Naveed Khalid on 01/01/2025.
//

import UIKit

class EmailVerification: UIViewController {
    
    
    
    @IBOutlet weak var emailTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.layer.cornerRadius = 9
        addPadding(to: emailTxtField)
    }
    
    func addPadding(to textField: UITextField) {
           let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
           textField.leftView = paddingView
           textField.leftViewMode = .always
       }
    
    @IBAction func emailSubmitButton(_ sender: UIButton) {
        if Utility.shared.isEmpty(emailTxtField.text ?? ""){
            showAlert(message: "Enter the email")
            return
        }
        
        if Utility.shared.isValidEmail(emailTxtField.text ?? ""){
            showAlert(message: "Email is not valid")
            return
        }
        
        FirebaseAuth.shared.resetPassword(email: emailTxtField.text!) { authResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
// for moving on root , but we define the root view controller
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: SignInViewController.self) {
                    self.navigationController!.popToViewController(controller, animated:    true)
                    break
                }
            }
            
// for moving on root screen
//            if let navigationController = self.navigationController {
//                navigationController.popToRootViewController(animated: true)
//            }
        }
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
