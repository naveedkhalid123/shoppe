//
//  SMSSignUpViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 02/01/2025.
//

import UIKit
import PhoneNumberKit
import FirebaseAuth

class SMSSignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    
    // Add var for setting phone number
    private var defaultRegion = "US"
    private var dialCode = "+1"
    
    let phoneNumberKit = PhoneNumberKit()
    
    var image: UIImage?
    
    
    @IBOutlet weak var uploadImgView: UIImageView!
    @IBOutlet weak var phoneNumberTxtField: PhoneNumberTextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var countryFlag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        uploadImgView.layer.cornerRadius = 45
        
        //  phone number default setting number placeholder
        self.phoneNumberTxtField.isPartialFormatterEnabled = true
        self.phoneNumberTxtField.withExamplePlaceholder = true
        self.phoneNumberTxtField.withPrefix = true
        self.phoneNumberTxtField.defaultRegion = defaultRegion
        self.phoneNumberTxtField.placeholder = phoneNumberKit.metadata(for: defaultRegion)?.mobile?.exampleNumber
        self.countryFlag.image = Utility.shared.imageUnicode(emoji: "🇺🇸",imageView: self.countryFlag)
        
    }
 
    func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    

    
    
    @IBAction func uploadImgBtnPressed(_ sender: UIButton) {
        let actionSheet = UIAlertController(
            title: "Upload Picture",
            message: "Choose a source to upload your picture",
            preferredStyle: .actionSheet
        )
        
        // Option for Camera
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.openImagePicker(sourceType: .camera)
            }))
        }
        
        // Option for Photo Library (Gallery)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                self.openImagePicker(sourceType: .photoLibrary)
            }))
        }
        
        // Cancel option
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Present the action sheet
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    
    
    @IBAction func selectCountryBtnPressed(_ sender: UIButton) {
        
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
                
                self.phoneNumberTxtField.defaultRegion = self.defaultRegion
                self.phoneNumberTxtField.placeholder = self.phoneNumberKit.metadata(for: self.defaultRegion)?.mobile?.exampleNumber
            }
        }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true)
    }
    
    
    @IBAction func doneBtnPressed(_ sender: UIButton) {
       
        if image == nil {
            showAlert(message: "Please upload the profile image")
            return
        }
        
    
        if Utility.shared.isEmpty(phoneNumberTxtField.text ?? "") {
            showAlert(message: "Enter the phone number")
            return
        }
        
        if Utility.shared.isValidPhoneNumber(phoneNumberTxtField.text!, region: defaultRegion) {
            showAlert(message: "Number is invalid")
            return
        }
        
        
        FirebaseAuth.shared.verifyPhoneNumber(phoneNumber: phoneNumberTxtField.text!) { authResult, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let vc = PasswordRecoveryOTPViewController(nibName: "PasswordRecoveryOTPViewController", bundle: nil)
    
            vc.image = self.image
            vc.number = self.phoneNumberTxtField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    private func openImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self // Assign the delegate
        imagePicker.sourceType = sourceType
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    // Delegate method called when the user selects a photo or takes a picture
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            uploadImgView.image = image
            self.image = image
        } else {
            print("No image was selected or captured")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    // Delegate method called when the user cancels the picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User cancelled the image picker")
        // Dismiss the picker
        picker.dismiss(animated: true, completion: nil)
    }

}






