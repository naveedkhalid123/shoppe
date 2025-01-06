//
//  SMSLoginViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 02/01/2025.
//

import UIKit
import PhoneNumberKit

class SMSLoginViewController: UIViewController {
    
    
    
    
    private var defaultRegion = "US"
    private var dialCode = "+1"
    let phoneNumberKit = PhoneNumberKit()
    
    @IBOutlet weak var phoneNumebrTxtField: PhoneNumberTextField!
    @IBOutlet weak var countryFlag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //  phone number default setting number placeholder
        self.phoneNumebrTxtField.isPartialFormatterEnabled = true
        self.phoneNumebrTxtField.withExamplePlaceholder = true
        self.phoneNumebrTxtField.withPrefix = true
        self.phoneNumebrTxtField.defaultRegion = defaultRegion
        self.phoneNumebrTxtField.placeholder = phoneNumberKit.metadata(for: defaultRegion)?.mobile?.exampleNumber
        self.countryFlag.image = Utility.shared.imageUnicode(emoji: "🇺🇸",imageView: self.countryFlag)
    }


    
    
    @IBAction func selectCountryBtn(_ sender: UIButton) {
        
        // Moving from select country button to countryCodeViewController
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "countryCodeViewController") as! countryCodeViewController
        
        
        // add call back method for moving back
        // Add code, flag and dial_code variables
        vc.callback = { (code,flag,dial_Code) -> Void in
            print("callback")
            print(code,flag,dial_Code)
            // Apply condition that everything should be selected
            if code.isEmpty && flag.isEmpty && dial_Code.isEmpty{
                print("Both code and flag are empty. Returning.")
                return
            } else {
                // Return countryCodeViewController, countryFlag, dialCode
                self.defaultRegion = code
                self.countryFlag.image = Utility.shared.imageUnicode(emoji: flag,imageView: self.countryFlag)
                self.dialCode = self.dialCode
                
                self.phoneNumebrTxtField.defaultRegion = self.defaultRegion
                self.phoneNumebrTxtField.placeholder = self.phoneNumberKit.metadata(for: self.defaultRegion)?.mobile?.exampleNumber
            }
        }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true)
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        if Utility.shared.isEmpty(phoneNumebrTxtField.text ?? "") {
            showAlert(message: "Enter the phone number")
            return
        }
        
        if Utility.shared.isValidPhoneNumber(phoneNumebrTxtField.text!, region: defaultRegion) {
            showAlert(message: "Number is invalid")
            return
        }
        
        
        
        
        FirebaseAuth.shared.verifyPhoneNumber(phoneNumber: phoneNumebrTxtField.text!) { verificationID, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let verificationID = verificationID else {
                print("Failed to retrieve verification ID.")
                return
            }

            // Save the verification ID for later use
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")

            // Navigate to the OTP verification screen
            let vc = PasswordRecoveryOTPViewController(nibName: "PasswordRecoveryOTPViewController", bundle: nil)
            vc.number = self.phoneNumebrTxtField.text!
            vc.isLogin = true
            self.navigationController?.pushViewController(vc, animated: true)
        }


    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
