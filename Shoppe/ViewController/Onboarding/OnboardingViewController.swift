//
//  OnboardingViewController.swift
//  Shoppe
//
//  Created by Naveed Khalid on 11/12/2024.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var onboardingArr = [
        ["image":"Boarding1","head":"Hello","subhead":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus."],   ["image":"Boarding2","head":"Ready?","subhead":"Lorem ipsum dolor sit amet, consectetur adipiscing elit."],]
  
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.register(UINib(nibName: "OnboardingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        
        
        
        // For page control
        pageControl.numberOfPages = onboardingArr.count
        
        // For UIView shadow , I made an extension and call it here
        onboardingCollectionView.dropShadow(color: .black)
    }
    
    
    // scrollView page controlling function
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = Int(scrollView.contentOffset.x / onboardingCollectionView.bounds.width)
        pageControl.currentPage = currentPage
        
        
        // For hidding the item of second collection view
        let indexPath = IndexPath(item: currentPage, section: 0)
        let cell = onboardingCollectionView.cellForItem(at: indexPath)as! OnboardingCollectionViewCell
        // Hide the last index item
        if currentPage == onboardingArr.count - 1 {
            cell.btnStart.isHidden = false
        }
    }
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.btnStart.addTarget(self, action:#selector(handleRegister), for: .touchUpInside)
        cell.onboardingImg.image = UIImage(named: onboardingArr[indexPath.row]["image"] ?? "")
        cell.onboardingHead.text = onboardingArr[indexPath.row]["head"]
        cell.onboardingSubHead.text = onboardingArr[indexPath.row]["subhead"]
        return cell
    }
    
    @objc func handleRegister(sender: UIButton){
        UserDefaults.standard.saveData(forKey: "onboarding", value: "true")
        let vc = WelcomeScreenViewController(nibName: "WelcomeScreenViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 614)
    }
    


}


