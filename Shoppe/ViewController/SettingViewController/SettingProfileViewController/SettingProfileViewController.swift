import UIKit

class SettingProfileViewController: UIViewController {
    
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set corner radius
        nameTxtField.layer.cornerRadius = 9
        emailTxtField.layer.cornerRadius = 9
        passwordTxtField.layer.cornerRadius = 9
        saveChangesButton.layer.cornerRadius = 9
        
        // Add padding to text fields
        addPadding(to: nameTxtField)
        addPadding(to: emailTxtField)
        addPadding(to: passwordTxtField)
    }
    
    // Function to add padding to a UITextField
    func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
    }
}
