//
//  SignInOptionsViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 02/01/2025.
//

import UIKit

class SignInOptionsViewController: UIViewController {
    
    
    @IBOutlet weak var SMSImageView: UIImageView!
    @IBOutlet weak var emailImageView: UIImageView!
    
    var didSelectImage = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    

    
    @IBAction func SMSBtnPressed(_ sender: UIButton) {
        
        didSelectImage = true
        SMSImageView.image = UIImage(named: "Check")
        emailImageView.image = UIImage(named: "Check Empty")
        
    }
    
    @IBAction func emailBtnPressed(_ sender: UIButton) {
        
        didSelectImage = false
        emailImageView.image = UIImage(named: "redCheck")
        SMSImageView.image = UIImage(named: "emptyBlue")
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if didSelectImage == true {
            let vc = SMSSignUpViewController(nibName: "SMSSignUpViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
