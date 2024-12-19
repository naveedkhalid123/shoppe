//
//  PaymentInProgressViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class PaymentInProgressViewController: UIViewController {
    
    @IBOutlet weak var progressImgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressImgView.dropShadow(color: .black)
    }
}
