
//
//  ProductsUpload.swift
//  Shoppe
//
//  Created by Naveed Khalid on 02/01/2025.
//

import UIKit
import FirebaseAuth
class ProductsUpload: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var selectedImages = [UIImage]()
    
    @IBOutlet weak var selectImagesButton: UIButton!
    @IBOutlet weak var selectImagesCollectionView: UICollectionView!
    @IBOutlet weak var categoryNameTxtField: UITextField!
    @IBOutlet weak var createCategoryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectImagesButton.layer.cornerRadius = 12
        createCategoryButton.layer.cornerRadius = 12
        categoryNameTxtField.layer.cornerRadius = 12
       // categoryNameTxtField.layer.borderWidth = 1
        //categoryNameTxtField.layer.borderColor = UIColor.black.cgColor
       // categoryNameTxtField.layer.backgroundColor = UIColor.black.cgColor
        addPadding(to: categoryNameTxtField)

        selectImagesCollectionView.delegate = self
        selectImagesCollectionView.dataSource = self
        selectImagesCollectionView.register(UINib(nibName: "SelectImgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectImgCollectionViewCell")
    }
    
    func addPadding(to textField: UITextField) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectImgCollectionViewCell", for: indexPath) as! SelectImgCollectionViewCell
        cell.selectedImages.image = selectedImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 200)
    }
    
    @IBAction func selectImagesBtnPressed(_ sender: UIButton) {
        if selectedImages.count != 4 {
            let actionSheet = UIAlertController(
                title: "Upload Picture",
                message: "Choose a source to upload your picture",
                preferredStyle: .actionSheet
            )
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                actionSheet.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
                    self.openImagePicker(sourceType: .camera)
                })
            }
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default) { _ in
                    self.openImagePicker(sourceType: .photoLibrary)
                })
            }
            
            actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(actionSheet, animated: true, completion: nil)
        }else {
            Utility.shared.showToast(message: "you don't upload more than 4 images")
        }
        
    }
    
    private func openImagePicker(sourceType: UIImagePickerController.SourceType) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImages.append(image)
            selectImagesCollectionView.reloadData()
        } else {
            print("No image was selected or captured")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User cancelled the image picker")
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createCategoryBtnPressed(_ sender: UIButton) {
        print("Create Category button pressed")
        
        let category = categoryNameTxtField.text ?? ""
        
        if selectedImages.count < 4 {
            Utility.shared.showToast(message: "Please upload the 4 images.")
            return
        }
        
        if category.isEmpty {
            Utility.shared.showToast(message: "Please enter the category name.")
            return
        }
        
        let currentUser = Auth.auth().currentUser
 
        FirebaseAuth.shared.createCategory(userID: currentUser?.uid ?? "", categoryName: category, selectedImages: selectedImages) { result, error in
            if let error = error {
                print("error \(error.localizedDescription)")
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        print("Cancel button pressed")
        self.dismiss(animated: true, completion: nil)
    }
}
