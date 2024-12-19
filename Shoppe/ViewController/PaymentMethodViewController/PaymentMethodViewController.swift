import UIKit

class PaymentMethodViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    var paymentCardArr = ["Card", "Card"]
    
    @IBOutlet weak var paymentCollectionView: UICollectionView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 11
        setupCollectionView()
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
    
  
}
