//
//  CustomerReviewViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 19/12/2024.
//

import UIKit

class CustomerReviewViewController: UIViewController {
    

    @IBOutlet weak var commentTxtField: UITextView!
    @IBOutlet weak var sayItButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTxtField.layer.cornerRadius = 9

        sayItButton.layer.cornerRadius = 9
    }



}
