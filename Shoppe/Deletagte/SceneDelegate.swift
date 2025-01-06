//
//  SceneDelegate.swift
//  Shoppe
//
//  Created by Naveed Khalid on 09/12/2024.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // code for running the screen
        
        
        
        
         //code for super admin user to bringing him on dashboard screen , if the user login through the admin@gmail.com
                if Auth.auth().currentUser != nil {
                    if  Auth.auth().currentUser?.email == "admin@gmail.com" {
                        let main = UIStoryboard(name: "Main", bundle: nil)
                        let vc = main.instantiateViewController(withIdentifier: "DashboardViewController")as! DashboardViewController
                        let navigationController = UINavigationController(rootViewController: vc)
                        navigationController.isNavigationBarHidden = true
                        self.window = UIWindow(windowScene: windowScene)
                        self.window?.rootViewController = navigationController
                        self.window?.makeKeyAndVisible()
        
                    } else {
        
                        // If the user login through other email except the admin email then bring him on TabBarViewController
                        print("User is already logged in")
                        // we assign the tabBraViewController
                        let main = UIStoryboard(name: "Main", bundle: nil)
                        let vc = main.instantiateViewController(withIdentifier: "TabBarViewController")as! TabBarViewController
                        let navigationController = UINavigationController(rootViewController: vc)
                        navigationController.isNavigationBarHidden = true
                        self.window = UIWindow(windowScene: windowScene)
                        self.window?.rootViewController = navigationController
                        self.window?.makeKeyAndVisible()
                    }
        
        
                }else {
                    if UserDefaults.standard.retreiveData(forKey: "onboarding") == "true" {
                        let languageVC = WelcomeScreenViewController(nibName: "WelcomeScreenViewController", bundle: nil)
                        let navigationController = UINavigationController(rootViewController: languageVC)
                        navigationController.isNavigationBarHidden = true
                        self.window = UIWindow(windowScene: windowScene)
                        self.window?.rootViewController = navigationController
                        self.window?.makeKeyAndVisible()
                    }else {
                        let languageVC = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
                        let navigationController = UINavigationController(rootViewController: languageVC)
                        navigationController.isNavigationBarHidden = true
                        self.window = UIWindow(windowScene: windowScene)
                        self.window?.rootViewController = navigationController
                        self.window?.makeKeyAndVisible()
                    }
                }
            }
        
        func sceneDidDisconnect(_ scene: UIScene) {
            // Called as the scene is being released by the system.
            // This occurs shortly after the scene enters the background, or when its session is discarded.
            // Release any resources associated with this scene that can be re-created the next time the scene connects.
            // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            // Called when the scene has moved from an inactive state to an active state.
            // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            // Called when the scene will move from an active state to an inactive state.
            // This may occur due to temporary interruptions (ex. an incoming phone call).
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            // Called as the scene transitions from the background to the foreground.
            // Use this method to undo the changes made on entering the background.
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            // Called as the scene transitions from the foreground to the background.
            // Use this method to save data, release shared resources, and store enough scene-specific state information
            // to restore the scene back to its current state.
        }
        
        
    }
    

