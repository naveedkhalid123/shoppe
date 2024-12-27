import UIKit

class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var productImgArr = ["product1", "product2", "product3", "product4", "product5", "product2", "product3"]
    
    var categoriesArr = [
        ["item1": "image1", "item2": "image2", "item3": "image3", "item4": "image4", "itemName": "Clothing", "itemNumber": "109"],
        ["item1": "image5", "item2": "image6", "item3": "image7", "item4": "image8", "itemName": "Shoes", "itemNumber": "530"],
        ["item1": "image9", "item2": "image10", "item3": "image11", "item4": "image12", "itemName": "Bags", "itemNumber": "87"],
        ["item1": "image13", "item2": "image14", "item3": "image15", "item4": "image16", "itemName": "Lingerie", "itemNumber": "218"],
        ["item1": "image17", "item2": "image18", "item3": "image19", "item4": "image20", "itemName": "Watch", "itemNumber": "218"],
        ["item1": "image21", "item2": "image22", "item3": "image23", "item4": "image24", "itemName": "Hoodies", "itemNumber": "109"],
        ["item1": "image17", "item2": "image18", "item3": "image19", "item4": "image20", "itemName": "Watch", "itemNumber": "218"],
        ["item1": "image21", "item2": "image22", "item3": "image23", "item4": "image24", "itemName": "Hoodies", "itemNumber": "109"]
    ]
    
    @IBOutlet weak var recentlyViewedCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var categoriesCollectionViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        recentlyViewedCollectionView.delegate = self
        recentlyViewedCollectionView.dataSource = self
        recentlyViewedCollectionView.register(UINib(nibName: "ProductsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        
        categoriesCollectionView.isScrollEnabled = true

        adjustCategoriesCollectionViewHeight()
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func adjustCategoriesCollectionViewHeight() {
        let itemsPerRow: CGFloat = 2
        let itemHeight: CGFloat = 192
        let totalRows = ceil(CGFloat(categoriesArr.count) / itemsPerRow)
        let totalHeight = totalRows * itemHeight
    
        categoriesCollectionViewHeight.constant = min(totalHeight, view.frame.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == recentlyViewedCollectionView {
            return productImgArr.count
        } else {
            return categoriesArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recentlyViewedCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            cell.productImages.image = UIImage(named: productImgArr[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as! CategoriesCollectionViewCell
            cell.image1.image = UIImage(named: categoriesArr[indexPath.row]["item1"] ?? "")
            cell.image2.image = UIImage(named: categoriesArr[indexPath.row]["item2"] ?? "")
            cell.image3.image = UIImage(named: categoriesArr[indexPath.row]["item3"] ?? "")
            cell.image4.image = UIImage(named: categoriesArr[indexPath.row]["item4"] ?? "")
            cell.categoryName.text = categoriesArr[indexPath.row]["itemName"]
            cell.categoryNumbers.text = categoriesArr[indexPath.row]["itemNumber"]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recentlyViewedCollectionView {
            return CGSize(width: (collectionView.frame.width / 5) - 9, height: 69)
        } else {
            let itemsPerRow: CGFloat = 2
            let padding: CGFloat = 10
            let totalPadding = padding * (itemsPerRow + 1)
            let individualWidth = (collectionView.frame.width - totalPadding) / itemsPerRow
            return CGSize(width: individualWidth, height: 192)
        }
    }
}
