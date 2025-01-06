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
    
    // For adding and removing the blur effect, we declare blur actions in the scren where we applying the blur action and call the dsimiss action in the original screen
    var dismissHandler: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneImgView.dropShadow(color: .black)
        trackOrderButton.layer.cornerRadius = 11
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // code for closing ther screen when the popup open , then user will click on the view and pop will close
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first
        dismissHandler?()
        if touch?.view == self.view {
            self.dismiss(animated: true)
        }
        
    }
    
    @IBAction func trackMyOrderButtonPressed(_ sender: UIButton) {
        dismissHandler?()
        self.dismiss(animated: true)
    }
}
