//
//  SignUpOptionsViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 03/01/2025.
//

import UIKit

class SignUpOptionsViewController: UIViewController {
    
    
    @IBOutlet weak var SMSImg: UIImageView!
    @IBOutlet weak var emailImg: UIImageView!
    
    var didSelectImage = true
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    @IBAction func SMSBtn(_ sender: UIButton) {
        
        didSelectImage = true
        SMSImg.image = UIImage(named: "Check")
        emailImg.image = UIImage(named: "Check Empty")
    }
    
    
    @IBAction func emailBtnPressed(_ sender: UIButton) {
        didSelectImage = false
        emailImg.image = UIImage(named: "redCheck")
        SMSImg.image = UIImage(named: "emptyBlue")
        
    }
    
    @IBAction func nextBtnPressed(_ sender: UIButton) {
        if didSelectImage == true {
            let vc = SMSLoginViewController(nibName: "SMSLoginViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = SignInViewController(nibName: "SignInViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
