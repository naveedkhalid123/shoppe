import UIKit

class ShippingAddressViewController: UIViewController {

    @IBOutlet weak var countryTxtField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var townTxtField: UITextField!
    @IBOutlet weak var postalCodeTxtField: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    
    
    
    var dismissHandler: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextField(countryTxtField)
        configureTextField(addressTextField)
        configureTextField(townTxtField)
        configureTextField(postalCodeTxtField)
        saveChangesButton.layer.cornerRadius = 11
    }
    
    
     // code for closing ther screen when the popup open , then user will click on the view and pop will close
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var touch: UITouch? = touches.first
        if touch?.view == self.view {
            dismissHandler?()
            self.dismiss(animated: true)
            
        }
        
    }

    // Helper function to style text fields
    private func configureTextField(_ textField: UITextField) {
        textField.layer.cornerRadius = 8
     
        textField.backgroundColor = UIColor(named: "Light blue")

        textField.layer.masksToBounds = true
        
        // Add left padding to the text field
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
    }
}
