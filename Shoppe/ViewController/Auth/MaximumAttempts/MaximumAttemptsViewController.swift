//
//  MaximumAttemptsViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 11/12/2024.
//

import UIKit

class MaximumAttemptsViewController: UIViewController {
    
    
    @IBOutlet weak var popupView: UIView!
    
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
        popupView.dropShadow(color: .black)
    
    }

}
