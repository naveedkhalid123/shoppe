//
//  PasswordRecoveryOTPViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 11/12/2024.
//

import UIKit
import DPOTPView
import Toast_Swift

class PasswordRecoveryOTPViewController: UIViewController, DPOTPViewDelegate {
   
    
    

    @IBOutlet weak var dpOTPView: DPOTPView!
    override func viewDidLoad() {
        super.viewDidLoad()

        dpOTPView.dpOTPViewDelegate = self
    }

    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func sendAgainButtonPressed(_ sender: UIButton) {
            let vc = MaximumAttemptsViewController(nibName: "MaximumAttemptsViewController", bundle: nil)
              vc.modalPresentationStyle = .overFullScreen // Optional: Set the presentation style
            self.present(vc, animated: true, completion: nil)
    
    }
    
    func dpOTPViewAddText(_ text: String, at position: Int) {
        if position == 3 {
            if text.count == 4 {
                print("Move to the next screen ")
            } else {
                self.view.makeToast("Please Enter Complete OTP",position: .top)
            }
        } else {
            
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
