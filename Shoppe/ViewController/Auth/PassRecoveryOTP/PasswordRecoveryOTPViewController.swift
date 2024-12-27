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
    
    
    // MARK: - Blur Effect
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.tag = 10
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.7
        self.view.addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        if let blurEffectView = self.view.viewWithTag(10) {
            blurEffectView.removeFromSuperview()
        }
    }
    
    
    @IBAction func sendAgainButtonPressed(_ sender: UIButton) {
        self.addBlurEffect()
        let vc = MaximumAttemptsViewController(nibName: "MaximumAttemptsViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc, animated: true)
    
    }
    
    func dpOTPViewAddText(_ text: String, at position: Int) {
        if position == 3 {
            if text.count == 4 {
                print("Move to the next screen ")
            } else {
               // self.view.makeToast("Please Enter Complete OTP",position: .top)
                showAlert(message: "Please Enter Complete OTP")
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


// MARK: - Presentation Controller Delegate
extension PasswordRecoveryOTPViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.removeBlurEffect()
    }
}
