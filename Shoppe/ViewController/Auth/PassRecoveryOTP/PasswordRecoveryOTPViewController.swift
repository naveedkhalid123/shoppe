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
    
    var isLogin = false
    
    var image: UIImage?
    var email = ""
    var number = ""
    
    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var dpOTPView: DPOTPView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblNumber.text = number
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
        if position == 5 {
            if text.count == 6 {
                print("Move to the next screen ")
                
                Utility.shared.showToastActivity()
                let verificationID = UserDefaults.standard.string(forKey: "authVerificationID") ?? ""
                
                if isLogin {
                    FirebaseAuth.shared.loginWithPhone(
                        verificationID:verificationID ,
                        verificationCode: text) { success, error in
                            if let error = error {
                                print("Error during OTP verification: \(error.localizedDescription)")
                                return
                            }
                            Utility.shared.hideToastActivity()
                            let story = UIStoryboard(name: "Main", bundle: nil)
                            if let vc = story.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
                                let navigationController = UINavigationController(rootViewController: vc)
                                navigationController.isNavigationBarHidden = true
                                self.navigationController?.pushViewController(vc, animated: true)
                            }

                            
                        }
                }else {
                    FirebaseAuth.shared.verifyOTPAndSaveUserData(
                        verificationID: verificationID,
                        verificationCode: text,
                        email: self.email,
                        profileImage: self.image!,
                        phoneNumber: number
                    ) { success, error in
                        if let error = error {
                            print("Error during OTP verification: \(error.localizedDescription)")
                            return
                        }
                        Utility.shared.hideToastActivity()
                        
                        for controller in self.navigationController!.viewControllers as Array {
                            if controller.isKind(of: WelcomeScreenViewController.self) {
                                self.navigationController!.popToViewController(controller, animated:    true)
                                break
                            }
                        }
                        
                    }
                }
                
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
