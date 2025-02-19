
import UIKit
import FirebaseAuth

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var headingArr = ["Personal","Shop","Account"]
    
    var personalHeadArr = [["countryNamesLbl": "Profile","countryCurrencyLbl":""],["countryNamesLbl":"Shipping Address","countryCurrencyLbl":""],["countryNamesLbl":"Payment methods","countryCurrencyLbl":""],]
    
    var shopHeadArr = [["countryNamesLbl":"Country","countryCurrencyLbl":"Vietnam"],["countryNamesLbl":"Currency","countryCurrencyLbl":"$ USD"],["countryNamesLbl":"Sizes","countryCurrencyLbl":"UK"],      ["countryNamesLbl":"Terms and Conditions","countryCurrencyLbl":""]]
    
    var accountHeadArr = [["countryNamesLbl":"Language","countryCurrencyLbl":"English"],["countryNamesLbl":"About Slada","countryCurrencyLbl":""],]

    
    @IBOutlet weak var settingTableView: UITableView!
    
    @IBOutlet weak var logoutBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutBtn.layer.cornerRadius = 10
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    // Header table view
    
    // call here main array
    func numberOfSections(in tableView: UITableView) -> Int {
        return headingArr.count
    }
    
    // call here headers array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return personalHeadArr.count
        }else if section == 1 {
            return shopHeadArr.count
        }else {
            return accountHeadArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell") as! SettingTableViewCell
        
        let dataArray: [[String: String]]
        switch indexPath.section {
        case 0:
            dataArray = personalHeadArr
        case 1:
            dataArray = shopHeadArr
        default:
            dataArray = accountHeadArr
        }
        
        // Populate the cell with the data
        let data = dataArray[indexPath.row]
        cell.countryNamesLbl.text = data["countryNamesLbl"]
        cell.countryCurrencyLbl.text = data["countryCurrencyLbl"]
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    // MARK: - Blur Effect
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.tag = 10
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.7
        self.view.addSubview(blurEffectView)
    }
    
    func removeBlurEffect() {
        if let blurEffectView = self.view.viewWithTag(10) {
            blurEffectView.removeFromSuperview()
        }
    }
    
    // MARK: - Table View Did Select
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: // Personal section
            switch indexPath.row {
            case 0:
                let vc = SettingProfileViewController(nibName: "SettingProfileViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                self.addBlurEffect()
                let vc = ShippingAddressViewController(nibName: "ShippingAddressViewController", bundle: nil)
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .crossDissolve
                vc.presentationController?.delegate = self
                vc.dismissHandler = { [weak self] in
                    self?.removeBlurEffect()
                }
                self.present(vc, animated: true)
            case 2:
                let vc = SettingAddCardViewController(nibName: "SettingAddCardViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        case 1: // Shop section
            switch indexPath.row {
            case 0:
                let vc = ChooseCountryViewController(nibName: "ChooseCountryViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = ChooseCountryViewController(nibName: "ChooseCountryViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                let vc = ChooseCountryViewController(nibName: "ChooseCountryViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case 3:
                let vc = AboutViewController(nibName: "AboutViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        case 2: // Account section
            switch indexPath.row {
            case 0:
                let vc = ChooseLanguageViewController(nibName: "ChooseLanguageViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                let vc = AboutViewController(nibName: "AboutViewController", bundle: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        default:
            break
        }
    }

    
    
    
    // Code for adding header section in table view
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 30))
        
        let label = UILabel()
        label.text = headingArr[section]
        label.frame = CGRect.init(x: 15, y: 0, width: headerView.frame.width-10, height: headerView.frame.height - 10)
        label.font = .systemFont(ofSize: 17,weight: .bold)
        
        label.textColor = .black
        
        headerView.addSubview(label)
        
        return headerView
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    @IBAction func deleteAccountButtonPressed(_ sender: UIButton) {
//        self.addBlurEffect()
//        let vc = DeleteAccountViewController(nibName: "DeleteAccountViewController", bundle: nil)
//        vc.modalPresentationStyle = .overFullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        vc.presentationController?.delegate = self
//        vc.dismissHandler = { [weak self] in
//            self?.removeBlurEffect()
//        }
//        self.present(vc, animated: true)
    }
    
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        
        self.addBlurEffect()
        let vc = DeleteAccountViewController(nibName: "DeleteAccountViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc, animated: true)
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
        self.gotoHomeController()
        
    }
    
    func gotoHomeController() {
            let vc = SignUpOptionsViewController(nibName: "SignUpOptionsViewController", bundle: nil)
            let nav = UINavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = nav
            }
        }
    
}

// MARK: - Presentation Controller Delegate
extension SettingViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.removeBlurEffect()
    }
}
