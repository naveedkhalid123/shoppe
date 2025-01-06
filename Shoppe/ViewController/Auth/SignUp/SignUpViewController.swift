
//
//  SignUpViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit
import Toast_Swift
import PhoneNumberKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    // Add var for setting phone number
    private var defaultRegion = "US"
    private var dialCode = "+1"
    let phoneNumberKit = PhoneNumberKit()
    
    var image: UIImage?
    
    
    @IBOutlet weak var uploadImageButton: UIButton!
    
    @IBOutlet weak var uploadPhotoView: UIImageView!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    // set the textfield to PhoneNumberTextField
    @IBOutlet weak var contactTxtField: PhoneNumberTextField!
    @IBOutlet weak var previewButton: UIButton!
    @IBOutlet weak var countryFlag: UIImageView!
    
    // Add a property to track password visibility state
    var isPasswordVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTxtField.layer.cornerRadius = 26
        passwordTxtField.layer.cornerRadius = 26
        
        addPadding(to: emailTxtField)
        addPadding(to: passwordTxtField)
        addPadding(to: contactTxtField)
        
        uploadPhotoView.layer.cornerRadius = 45
        
        
        
        //  phone number default setting number placeholder
        self.contactTxtField.isPartialFormatterEnabled = true
        self.contactTxtField.withExamplePlaceholder = true
        self.contactTxtField.withPrefix = true
        self.contactTxtField.defaultRegion = defaultRegion
        self.contactTxtField.placeholder = phoneNumberKit.metadata(for: defaultRegion)?.mobile?.exampleNumber
        self.countryFlag.image = Utility.shared.imageUnicode(emoji: "🇺🇸",imageView: self.countryFlag)
        
    }
    
    func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        if image == nil {
            showAlert(message: "Please upload the profile image")
            return
        }
        
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
        
        if Utility.shared.isValidPhoneNumber(contactTxtField.text!, region: defaultRegion) {
            showAlert(message: "Number is invalid")
            return
        }
        
        FirebaseAuth.shared.createUser(email: emailTxtField.text!, password: passwordTxtField.text!, profileImage: image! , phoneNumber: contactTxtField.text!) { authResult, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            let vc = PasswordViewController(nibName: "PasswordViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
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
    
    
    
    // code for entering from nib to storyboard screen
    @IBAction func selectCountryButtonPressed(_ sender: UIButton) {
        
        
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
                
                self.contactTxtField.defaultRegion = self.defaultRegion
                self.contactTxtField.placeholder = self.phoneNumberKit.metadata(for: self.defaultRegion)?.mobile?.exampleNumber
            }
        }
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true)
    }
    
    
    @IBAction func uploadImageButtonPressed(_ sender: UIButton) {
        
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
            uploadPhotoView.image = image
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




