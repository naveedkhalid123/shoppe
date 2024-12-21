//
//  DeleteAccountViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 21/12/2024.
//

import UIKit

class DeleteAccountViewController: UIViewController {
    
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButton.layer.cornerRadius = 11
        deleteButton.layer.cornerRadius = 11
    }

}
