//
//  AppDelegate.swift
//  Shoppe
//
//  Created by Naveed Khalid on 09/12/2024.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import IQKeyboardManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Firebase configuration code
        FirebaseApp.configure()
        // keyboardManager
        IQKeyboardManager.shared().isEnabled = true

//         code for checking fonts embeded in the projects
//        UIFont.familyNames.forEach({ familyName in
//             let fontNames = UIFont.fontNames(forFamilyName: familyName)
//             print(familyName, fontNames)
//         })
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

