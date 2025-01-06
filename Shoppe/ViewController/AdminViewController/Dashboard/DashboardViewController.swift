//
//  DashboardViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 03/01/2025.
//

import UIKit
import FirebaseAuth

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var dashboardItemsArr = ["Produts","Category","Shipping","Coupans"]
  

    @IBOutlet weak var logoutBtn: UIButton!
    
    @IBOutlet weak var dashboardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutBtn.layer.cornerRadius = 10
        dashboardCollectionView.delegate = self
        dashboardCollectionView.dataSource = self
        dashboardCollectionView.register(UINib(nibName: "DashboardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DashboardCollectionViewCell")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashboardItemsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionViewCell", for: indexPath) as! DashboardCollectionViewCell
        cell.dashboardLbl.text = dashboardItemsArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: (collectionView.frame.width / 3) - 9, height: 35)
    }
    
    @IBAction func logoutBtnPressed(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        self.gotoHomeController()
    }
    
    
    func gotoHomeController() {
            let vc = SignInViewController(nibName: "SignInViewController", bundle: nil)
            let nav = UINavigationController(rootViewController: vc)
            nav.navigationBar.isHidden = true
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = nav
            }
        }
    
}
