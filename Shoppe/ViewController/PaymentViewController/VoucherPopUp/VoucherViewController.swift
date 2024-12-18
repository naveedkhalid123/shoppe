//
//  VoucherViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 18/12/2024.
//

import UIKit

class VoucherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var vouchersArr = [["validUptoLbl":"Valid Until 5.16.20","voucherCategoryLbl":"First Purchase","discountDesLbl":"5% off for your next order"],
                       ["validUptoLbl":"Valid Until 5.16.20","voucherCategoryLbl":"Gift From Customer Care","discountDesLbl":"15% off for your next order"],
                       ["validUptoLbl":"Valid Until 5.16.20","voucherCategoryLbl":"First Purchase","discountDesLbl":"5% off for your next order"],]

    @IBOutlet weak var vouchersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        vouchersTableView.delegate = self
        vouchersTableView.dataSource = self
        vouchersTableView.register(UINib(nibName: "VouchersTableViewCell", bundle: nil), forCellReuseIdentifier: "VouchersTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vouchersArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "VouchersTableViewCell", for: indexPath) as! VouchersTableViewCell
            cell.validUptoLbl.text = vouchersArr[indexPath.row]["validUptoLbl"]
            cell.voucherCategoryLbl.text = vouchersArr[indexPath.row]["voucherCategoryLbl"]
            cell.discountDesLbl.text = vouchersArr[indexPath.row]["discountDesLbl"]
            return cell
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 6 // Space between cells
    }
}


