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

        if let themeColor = UIColor(named: "theme") {
        addVoucherButton.layer.borderColor = themeColor.cgColor
        }
        addVoucherButton.layer.borderWidth = 1.0
        addVoucherButton.layer.cornerRadius = 11
        addVoucherButton.clipsToBounds = true

        cardButton.layer.cornerRadius = 18
        cardButton.backgroundColor = UIColor(named: "Light blue")

        payButton.layer.cornerRadius = 11

        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        itemsTableView.register(UINib(nibName: "ItemsTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsTableViewCell")

        shippingOptionsTableView.delegate = self
        shippingOptionsTableView.dataSource = self
        shippingOptionsTableView.register(UINib(nibName: "ShippingOptionsTableViewCell", bundle: nil), forCellReuseIdentifier: "ShippingOptionsTableViewCell")
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



