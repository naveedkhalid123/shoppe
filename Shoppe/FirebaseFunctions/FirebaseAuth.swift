//
//  FirebaseAuth.swift
//  Shoppe
//
//  Created by Naveed Khalid on 31/12/2024.
//


import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

final class FirebaseAuth {
    static let shared = FirebaseAuth()
    
    private init() {}
    
    
    // utliity shared fucntion
    private let functions = Utility.shared
    
    func signIn(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let user = authResult?.user else {
                print("No user found")
                completion(false, nil)
                return
            }
            
            if user.isEmailVerified {
                self.functions.showToast(message: "Signed in successfully. Email is verified.")
                completion(true, nil)
            } else {
                self.functions.showToast(message: "Email is not verified. Please check your email.")
                completion(false, nil)
            }
        }
    }
    
    //    func createUser(email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
    //        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
    //            if let error = error {
    //                completion(false, error)
    //                return
    //            }
    //
    //            guard let user = authResult?.user else {
    //                print("User creation failed")
    //                completion(false, nil)
    //                return
    //            }
    //
    //            user.sendEmailVerification { error in
    //                if let error = error {
    //                    print("Error sending verification email: \(error.localizedDescription)")
    //                    completion(false, error)
    //                } else {
    //                    self.functions.showToast(message: "User created successfully. Verification email sent.")
    //                    completion(true, nil)
    //                }
    //            }
    //        }
    //    }
    
    
    func createUser(email: String, password: String, profileImage: UIImage, phoneNumber: String, completion: @escaping (Bool, Error?) -> Void) {
        // Step 1: Create User in Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let user = authResult?.user else {
                print("User creation failed")
                completion(false, nil)
                return
            }
            
            self.uploadProfileImage(userID: user.uid, profileImage: profileImage) { imageURL, uploadError in
                if let uploadError = uploadError {
                    print("Error uploading profile image: \(uploadError.localizedDescription)")
                    completion(false, uploadError)
                    return
                }
                
                guard let profileImageURL = imageURL else {
                    print("Failed to retrieve uploaded image URL.")
                    completion(false, nil)
                    return
                }
                
                // Step 3: Save User Data in Firebase Realtime Database
                self.saveUserData(userID: user.uid, email: email, phoneNumber: phoneNumber, profileImageURL: profileImageURL) { success, saveError in
                    if !success {
                        print("Error saving user data: \(saveError?.localizedDescription ?? "Unknown error")")
                        completion(false, saveError)
                        return
                    }
                    
                    user.sendEmailVerification { error in
                        if let error = error {
                            print("Error sending verification email: \(error.localizedDescription)")
                            completion(false, error)
                        } else {
                            self.functions.showToast(message: "User created successfully. Verification email sent.")
                            completion(true, nil)
                        }
                    }
                }
            }
        }
    }
    
    func getCurrentUserInfo(completion: (User?) -> Void) {
        let user = Auth.auth().currentUser
        completion(user)
    }
    
    
    
    // firebase database and storage code
    func saveUserData(userID: String, email: String, phoneNumber: String, profileImageURL: String, completion: @escaping (Bool, Error?) -> Void) {
        // Define the user data to save
        var userData: [String: Any]
        if email.isEmpty {
            userData = [
                "userId": userID,
                "phoneNumber": phoneNumber,
                "profileImage": profileImageURL
            ]
        }else {
            userData = [
                "userId": userID,
                "email": email,
                "phoneNumber": phoneNumber,
                "profileImage": profileImageURL
            ]
        }
        
        
        // Save data in the Firebase Realtime Database
        Database.database().reference()
            .child("users")
            .child(userID)
            .setValue(userData) { error, _ in
                if let error = error {
                    print("Error saving user data: \(error.localizedDescription)")
                    completion(false, error)
                    return
                }
                
                print("User data saved successfully.")
                completion(true, nil)
            }
    }
    
    func uploadProfileImage(userID: String, profileImage: UIImage, completion: @escaping (String?, Error?) -> Void) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.8) else {
            print("Failed to convert image to data")
            completion(nil, nil)
            return
        }
        
        let storageRef = Storage.storage()
            .reference()
            .child(userID)
            .child("profileImage")
            .child("profile.jpg")
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            // Get the download URL of the image
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    completion(nil, error)
                    return
                }
                
                guard let imageURL = url?.absoluteString else {
                    print("Download URL is nil")
                    completion(nil, nil)
                    return
                }
                
                print("Image uploaded successfully with URL: \(imageURL)")
                completion(imageURL, nil)
            }
        }
    }
    
    func resetPassword(email: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error sending password reset email: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            
            self.functions.showToast(message: "Password reset email sent successfully. Check your inbox.")
            completion(true, nil)
        }
    }
    
    func verifyPhoneNumber(
        phoneNumber: String,
        completion: @escaping (String?, Error?) -> Void
    ) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                print("Error verifying phone number: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            guard let verificationID = verificationID else {
                print("Failed to retrieve verification ID")
                completion(nil, nil)
                return
            }
            UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            
            
            self.functions.showToast(message: "Otp sent to your mobile phone")
            completion(verificationID, nil)
        }
    }
    
    
    func createPhoneAuthCredential(verificationID: String, verificationCode: String) -> PhoneAuthCredential {
        return PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
    }
    
    func verifyOTPAndSaveUserData(
        verificationID: String,
        verificationCode: String,
        email: String,
        profileImage: UIImage,
        phoneNumber: String,
        completion: @escaping (Bool, Error?) -> Void
    ) {
        let phoneCredential = createPhoneAuthCredential(verificationID: verificationID, verificationCode: verificationCode)
        
        Auth.auth().signIn(with: phoneCredential) { authResult, error in
            if let error = error {
                print("Error signing in with phone credential: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            
            guard let user = authResult?.user else {
                print("User creation failed")
                completion(false, nil)
                return
            }
            
            self.uploadProfileImage(userID: user.uid, profileImage: profileImage) { imageURL, uploadError in
                if let uploadError = uploadError {
                    print("Error uploading profile image: \(uploadError.localizedDescription)")
                    completion(false, uploadError)
                    return
                }
                
                guard let profileImageURL = imageURL else {
                    print("Failed to retrieve uploaded image URL.")
                    completion(false, nil)
                    return
                }
                
                self.saveUserData(userID: user.uid, email: email, phoneNumber: phoneNumber, profileImageURL: profileImageURL) { success, saveError in
                    if !success {
                        print("Error saving user data: \(saveError?.localizedDescription ?? "Unknown error")")
                        completion(false, saveError)
                        return
                    }
                    
                    print("User data saved successfully.")
                    self.functions.showToast(message: "User created and signed in successfully.")
                    completion(true, nil)
                }
            }
        }
    }
    
    func loginWithPhone(verificationID: String, verificationCode: String, completion: @escaping (Bool, Error?) -> Void) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                print("Error signing in with phone credential: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            
            guard let user = authResult?.user else {
                print("No user found after phone login.")
                completion(false, nil)
                return
            }
            
            print("User signed in with phone number: \(user.phoneNumber ?? "Unknown phone number")")
            completion(true, nil)
        }
    }
    
    
    func createCategory(userID: String, categoryName: String, selectedImages: [UIImage], completion: @escaping (Bool, Error?) -> Void) {
        let databaseRef = Database.database().reference().child("category")
        let storageRef = Storage.storage().reference().child("categories/\(categoryName)")
        
        // Fetch existing categories to determine the next unique ID
        databaseRef.observeSingleEvent(of: .value) { snapshot in
            var nextID = 0
            
            // Check if there are existing categories and determine the next ID
            if let categories = snapshot.value as? [String: Any] {
                let ids = categories.keys.compactMap { Int($0) }
                nextID = (ids.max() ?? -1) + 1
            }
            
            let newCategoryRef = databaseRef.child("\(nextID)")
            
            // Check if category with the same name already exists
            let duplicateCategory = snapshot.children.allObjects.contains { snap in
                if let snap = snap as? DataSnapshot,
                   let data = snap.value as? [String: Any],
                   let existingName = data["categoryName"] as? String {
                    return existingName == categoryName
                }
                return false
            }
            
            if duplicateCategory {
                self.functions.showToast(message: "Category name already exists.")
                completion(false, nil)
                return
            }
            
            self.functions.showToastActivity()
            var imageURLs: [String] = []
            let dispatchGroup = DispatchGroup()
            
            // Upload images
            for (index, image) in selectedImages.enumerated() {
                dispatchGroup.enter()
                
                guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                    print("Error converting image to data.")
                    self.functions.hideToastActivity()
                    dispatchGroup.leave()
                    continue
                }
                
                let imageRef = storageRef.child("image\(index + 1).jpg")
                imageRef.putData(imageData, metadata: nil) { _, error in
                    if let error = error {
                        print("Error uploading image: \(error.localizedDescription)")
                        dispatchGroup.leave()
                        return
                    }
                    
                    imageRef.downloadURL { url, error in
                        if let error = error {
                            self.functions.hideToastActivity()
                            print("Error getting download URL: \(error.localizedDescription)")
                        } else if let url = url {
                            imageURLs.append(url.absoluteString)
                        }
                        dispatchGroup.leave()
                    }
                }
            }
            
            dispatchGroup.notify(queue: .main) {
                // After all images are uploaded, save the category data
                if imageURLs.count == selectedImages.count {
                    let categoryData: [String: Any] = [
                        "userId": userID,
                        "categoryName": categoryName,
                        "image1": imageURLs.count > 0 ? imageURLs[0] : "",
                        "image2": imageURLs.count > 1 ? imageURLs[1] : "",
                        "image3": imageURLs.count > 2 ? imageURLs[2] : "",
                        "image4": imageURLs.count > 3 ? imageURLs[3] : ""
                    ]
                    
                    newCategoryRef.setValue(categoryData) { error, _ in
                        if let error = error {
                            self.functions.hideToastActivity()
                            print("Error saving category data: \(error.localizedDescription)")
                            completion(false, error)
                            return
                        }
                        
                        self.functions.showToast(message: "Category data saved successfully.")
                        self.functions.hideToastActivity()
                        completion(true, nil)
                    }
                } else {
                    self.functions.hideToastActivity()
                    self.functions.showToast(message: "Error: Not all images were uploaded.")
                    completion(false, nil)
                }
            }
        }
    }
    
    func deleteCategory(at id: Int, completion: @escaping (Bool, Error?) -> Void) {
        let categoryRef = Database.database().reference().child("category").child("\(id)")

        categoryRef.removeValue { error, _ in
            if let error = error {
                print("Error deleting category: \(error.localizedDescription)")
                self.functions.showToast(message: "Failed to delete category.")
                completion(false, error)
            } else {
                print("Category deleted successfully.")
                self.functions.showToast(message: "Category deleted successfully.")
                completion(true, nil)
            }
        }
    }

}
