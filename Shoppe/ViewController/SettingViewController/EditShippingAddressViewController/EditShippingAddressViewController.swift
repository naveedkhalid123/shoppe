//
//  EditShippingAddressViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class EditShippingAddressViewController: UIViewController {
    
    
    @IBOutlet weak var addressTxtField: UITextField!
    @IBOutlet weak var townTxtField: UITextField!
    @IBOutlet weak var postcodeTxtField: UITextField!
    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addressTxtField.layer.cornerRadius = 9
        townTxtField.layer.cornerRadius = 9
        postcodeTxtField.layer.cornerRadius = 9
        phoneNumberTxtField.layer.cornerRadius = 9
        
        saveChangesButton.layer.cornerRadius = 9
        
        // Adding padding to the text fields
        addPadding(to: addressTxtField)
        addPadding(to: townTxtField)
        addPadding(to: postcodeTxtField)
        addPadding(to: phoneNumberTxtField)

    }
    
    func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }

}
