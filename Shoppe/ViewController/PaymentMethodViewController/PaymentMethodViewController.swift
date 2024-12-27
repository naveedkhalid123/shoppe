import UIKit

class PaymentMethodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    var paymentCardArr = ["Card", "Card"]
    
    @IBOutlet weak var paymentCollectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    
     // For adding and removing the blur effect, we declare blur actions in the scren where we applying the blur action and call the dsimiss action in the original screen
    var dismissHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 11
        setupCollectionView()
    }
    
    // code for closing ther screen when the popup open , then user will click on the view and pop will close
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       var touch: UITouch? = touches.first
       dismissHandler?()
       if touch?.view == self.view {
           self.dismiss(animated: true)
       }
       
   }
    
    func setupCollectionView() {
        paymentCollectionView.delegate = self
        paymentCollectionView.dataSource = self
        paymentCollectionView.register(UINib(nibName: "PaymentMethodCollectionViewCell", bundle: nil),forCellWithReuseIdentifier: "PaymentMethodCollectionViewCell")
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paymentCardArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentMethodCollectionViewCell", for: indexPath) as! PaymentMethodCollectionViewCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 155)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    @IBAction func addPaymentButtonPressed(_ sender: UIButton) {
        
        let vc = SettingAddCardPopUp(nibName: "SettingAddCardPopUp", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
        
    }        
    
    
    
}
