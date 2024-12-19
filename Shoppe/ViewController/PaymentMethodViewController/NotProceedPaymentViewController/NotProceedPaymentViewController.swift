//
//  Couldn'tProceedPaymentViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class NotProceedPaymentViewController: UIViewController {
    
    
    
    @IBOutlet weak var warningImgView: UIView!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tryAgainButton.layer.cornerRadius = 11
        changeButton.layer.cornerRadius = 11
        
        warningImgView.dropShadow(color: .black)

  
    }
}
