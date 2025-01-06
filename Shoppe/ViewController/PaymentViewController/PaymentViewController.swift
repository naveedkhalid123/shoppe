import UIKit

class PaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var itemsArr = [["image": "cartItem1", "desc": "Lorem ipsum dolor sit amet consectetur.", "price": "$17,00", "itemCount": "1"],
                   ["image": "cartItem1", "desc": "Lorem ipsum dolor sit amet consectetur.", "price": "$17,00", "itemCount": "1"]]

    var shippingArr = [["checkOptionsImage": "Check Empty 1", "shippingCategory": "Standard", "shippingDuration": "5-7 days",           "shippingPrice": "FREE"],
                      ["checkOptionsImage": "Check Empty 1", "shippingCategory": "Express", "shippingDuration": "2-3 days", "shippingPrice": "$10"]]

    @IBOutlet weak var addVoucherButton: UIButton!
    @IBOutlet weak var cardButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var itemsTableView: UITableView!
    @IBOutlet weak var shippingOptionsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = false
        
        if let themeColor = UIColor(named: "theme") {
        addVoucherButton.layer.borderColor = themeColor.cgColor
        }
        addVoucherButton.layer.borderWidth = 1.0
        addVoucherButton.layer.cornerRadius = 11
        addVoucherButton.clipsToBounds = true

        cardButton.layer.cornerRadius = 12
        cardButton.backgroundColor = UIColor(named: "Light blue")

        payButton.layer.cornerRadius = 11

        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")

        shippingOptionsTableView.delegate = self
        shippingOptionsTableView.dataSource = self
        shippingOptionsTableView.register(UINib(nibName: "ShippingOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippingOptionsTableViewCell")
        
        
    }
    
    
    @IBAction func editShippingAddressBtnPressed(_ sender: UIButton) {
        let vc = EditShippingAddressViewController(nibName: "EditShippingAddressViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func addVoucherButtonPressed(_ sender: UIButton) {
        self.addBlurEffect()
        let vc = VoucherViewController(nibName: "VoucherViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc, animated: true)
        
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
    
    
    
    @IBAction func editPaymentMethodBtnPressed(_ sender: UIButton) {
        self.addBlurEffect()
        let vc = PaymentMethodViewController(nibName: "PaymentMethodViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.presentationController?.delegate = self
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
        }
        self.present(vc, animated: true)
    }
    
    
    
    @IBAction func payButtonPressed(_ sender: UIButton) {
        self.addBlurEffect()
        let vc = DonePaymentViewController(nibName: "DonePaymentViewController", bundle: nil)
        vc.dismissHandler = { [weak self] in
            self?.removeBlurEffect()
            
            
            // when we assign the new root , then the prevoius tabbar become remove , that why  we assign the dismissHandler?() function in  the track order button and give the path for next view controller here under the payButtonPressed
            let vc = ToReceiveViewController(nibName: "ToReceiveViewController", bundle: nil)
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        // Code for entering rootviewcontroller , when add a navigaion controller progmatically , when enters from storyboard to the nib
        let navigation = UINavigationController(rootViewController: vc)
        navigation.isNavigationBarHidden = true
       
        navigation.modalPresentationStyle = .overFullScreen
        navigation.modalTransitionStyle = .crossDissolve
        navigation.presentationController?.delegate = self
       
        self.present(navigation, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == itemsTableView {
            return itemsArr.count
        } else {
            return shippingArr.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == itemsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsTableViewCell", for: indexPath) as! ItemsTableViewCell
            let currentItem = itemsArr[indexPath.row]
            cell.itemsImages.image = UIImage(named: currentItem["image"] ?? "")
            cell.itemsDesc.text = currentItem["desc"]
            cell.itemsPrice.text = currentItem["price"]
            cell.itemsNumber.text = currentItem["itemCount"]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShippingOptionsTableViewCell", for: indexPath) as! ShippingOptionsTableViewCell

            let currentShipping = shippingArr[indexPath.row]
            cell.checkOptionsImage.image = UIImage(named: currentShipping["checkOptionsImage"] ?? "")
            cell.shippingCategory.text = currentShipping["shippingCategory"]
            cell.shippingDuration.text = currentShipping["shippingDuration"]
            cell.shippingPrice.text = currentShipping["shippingPrice"]
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Selected item at row \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}






// MARK: - Presentation Controller Delegate
extension PaymentViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.removeBlurEffect()
    }
}
