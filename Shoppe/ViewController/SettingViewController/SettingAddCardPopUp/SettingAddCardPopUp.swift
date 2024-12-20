//
//  SettingAddCardPopUp.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class SettingAddCardPopUp: UIViewController {
    
    @IBOutlet weak var cardHolderTxtField: UITextField!
    @IBOutlet weak var cardNumberTxtField: UITextField!
    @IBOutlet weak var validTxtField: UITextField!
    @IBOutlet weak var cvvTxtField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding corner radius
        cardHolderTxtField.layer.cornerRadius = 9
        cardNumberTxtField.layer.cornerRadius = 9
        validTxtField.layer.cornerRadius = 9
        cvvTxtField.layer.cornerRadius = 9
        saveButton.layer.cornerRadius = 9
        
        // Adding padding to the text fields
        addPadding(to: cardHolderTxtField)
        addPadding(to: cardNumberTxtField)
        addPadding(to: validTxtField)
        addPadding(to: cvvTxtField)
    }
    
    func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
}
