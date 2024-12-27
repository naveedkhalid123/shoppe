//
//  PasswordViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 10/12/2024.
//

import UIKit
import DPOTPView
import Toast_Swift
class PasswordViewController: UIViewController, DPOTPViewDelegate {
    
    
    @IBOutlet weak var OTPView: DPOTPView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OTPView.dpOTPViewDelegate = self
       
    }
    
    @IBAction func nowNowButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func dpOTPViewAddText(_ text: String, at position: Int) {
        if  position == 3 {
            if text.count == 4 {
                print("move to nextscreen")
            }else {
                self.view.makeToast("Please Enter Complete OTP",position: .top)
            }
           
        }else{
            
        }
    }
    
    func dpOTPViewRemoveText(_ text: String, at position: Int) {
       
    }
    
    func dpOTPViewChangePositionAt(_ position: Int) {
       
       
    }
    func dpOTPViewBecomeFirstResponder() {
        
    }
    func dpOTPViewResignFirstResponder() {
        
    }
    

    
}




