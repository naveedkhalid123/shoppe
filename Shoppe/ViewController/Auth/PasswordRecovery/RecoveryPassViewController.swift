//
//  RecoveryPassViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit

class RecoveryPassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func SMSButtonPressed(_ sender: UIButton) {
        let vc = PasswordRecoveryOTPViewController(nibName: "PasswordRecoveryOTPViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func emailButtonPreesed(_ sender: UIButton) {
        let vc = NewPasswordViewController(nibName: "NewPasswordViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
