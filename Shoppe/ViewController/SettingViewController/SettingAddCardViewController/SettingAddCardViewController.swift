//
//  SettingAddCardViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 20/12/2024.
//

import UIKit

class SettingAddCardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    var paymentCardArr = ["Card", "Card"]
    
    var dismissHandler: (() -> Void)?

    // code for closing ther screen when the popup open , then user will click on the view and pop will close
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       var touch: UITouch? = touches.first
       dismissHandler?()
       if touch?.view == self.view {
           self.dismiss(animated: true)
       }
       
   }
    
    
    @IBOutlet weak var addCardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCardCollectionView.delegate = self
        addCardCollectionView.dataSource = self
        addCardCollectionView.register(UINib(nibName: "PaymentMethodCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "PaymentMethodCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentCardArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentMethodCollectionViewCell", for: indexPath) as! PaymentMethodCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1, height: 155)
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
    
    
    @IBAction func addCardButtonPressed(_ sender: UIButton) {
        
        self.addBlurEffect()
        let vc = SettingAddCardPopUp(nibName: "SettingAddCardPopUp", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc,animated: true)
    }
    
    
    
}


// MARK: - Presentation Controller Delegate
extension SettingAddCardViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.removeBlurEffect()
    }
}


