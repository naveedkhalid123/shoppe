//
//  WelcomeScreenViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    

    }
    
    @IBAction func getStartedButtonPressed(_ sender: UIButton) {
        let vc = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let vc = SignInViewController(nibName: "SignInViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
