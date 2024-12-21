//
//  ChooseLanguageViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 21/12/2024.
//

import UIKit

class ChooseLanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var languagesArr = ["English","Français","Русский","Tiếng Việt "]
    
    @IBOutlet weak var languagesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        languagesTableView.delegate = self
        languagesTableView.dataSource = self
        languagesTableView.register(UINib(nibName: "LanguageTableViewcellTableViewCell", bundle: nil), forCellReuseIdentifier: "LanguageTableViewcellTableViewCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageTableViewcellTableViewCell", for: indexPath) as! LanguageTableViewcellTableViewCell
        cell.languagesLbl.text = languagesArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
