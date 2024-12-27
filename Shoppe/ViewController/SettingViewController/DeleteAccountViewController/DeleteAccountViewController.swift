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
    
   
    
    
    // code for closing ther screen when the popup open , then user will click on the view and pop will close
    var dismissHandler: (() -> Void)?
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       var touch: UITouch? = touches.first
       dismissHandler?()
       if touch?.view == self.view {
           self.dismiss(animated: true)
       }
       
   }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cancelButton.layer.cornerRadius = 11
        deleteButton.layer.cornerRadius = 11
    }

}
