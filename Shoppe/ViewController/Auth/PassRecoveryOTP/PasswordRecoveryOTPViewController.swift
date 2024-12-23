//
//  PasswordRecoveryOTPViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 11/12/2024.
//

import UIKit

class PasswordRecoveryOTPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func sendAgainButtonPressed(_ sender: UIButton) {
            let vc = MaximumAttemptsViewController(nibName: "MaximumAttemptsViewController", bundle: nil)
            vc.modalPresentationStyle = .fullScreen // Optional: Set the presentation style
            self.present(vc, animated: true, completion: nil)
    
    }
    
}
