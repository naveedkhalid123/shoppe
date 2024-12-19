//
//  DonePaymentViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class DonePaymentViewController: UIViewController {
    
    
    @IBOutlet weak var doneImgView: UIView!
    @IBOutlet weak var trackOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneImgView.dropShadow(color: .black)
        trackOrderButton.layer.cornerRadius = 11
    }


}
