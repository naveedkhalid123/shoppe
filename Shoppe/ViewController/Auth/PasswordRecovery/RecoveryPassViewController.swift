//
//  RecoveryPassViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit

class RecoveryPassViewController: UIViewController {
    
    
    @IBOutlet weak var SMSImage: UIImageView!
    @IBOutlet weak var EmailImage: UIImageView!
    
    var didSelectImage = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func SMSButtonPressed(_ sender: UIButton) {

        didSelectImage = true
        SMSImage.image = UIImage(named: "Check")
        EmailImage.image = UIImage(named: "Check Empty")
       
        
    }
    
    
    @IBAction func emailButtonPreesed(_ sender: UIButton) {

        
        didSelectImage = false
        EmailImage.image = UIImage(named: "redCheck")
        SMSImage.image = UIImage(named: "emptyBlue")
        
        
        


    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if didSelectImage == true {
            let vc = PasswordRecoveryOTPViewController(nibName: "PasswordRecoveryOTPViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = EmailVerification(nibName: "EmailVerification", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    
}
