//
//  ViewController.swift
//  Collage Maker
//
//  Created by Naveed Khalid on 06/01/2025.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // Scroll View
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // Custom View
    private let customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "viewColor")
        view.layer.cornerRadius = 6
        return view
    }()
    
    // Sign-Up Button
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(named: "main")
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 6
        return button
    }()
    
    // User Name Label
    private let usernameLbl: UILabel = {
        let userNamelbl = UILabel()
        userNamelbl.translatesAutoresizingMaskIntoConstraints = false
        userNamelbl.text = "User Name"
        userNamelbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return userNamelbl
    }()

    // User Name Text Field
    private let tfuserName: UITextField = {
        let tfuserName = UITextField()
        tfuserName.translatesAutoresizingMaskIntoConstraints = false
        tfuserName.backgroundColor = .white
        tfuserName.layer.cornerRadius = 6
        tfuserName.attributedPlaceholder = NSAttributedString(
            string: "Enter User Name",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
            ]
        )

     
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfuserName.frame.height))
        tfuserName.leftView = paddingView
        tfuserName.leftViewMode = .always
        
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfuserName.frame.height))
        tfuserName.rightView = rightPaddingView
        tfuserName.rightViewMode = .always
        
        return tfuserName
    
    }()
    
    private let passwordLbl : UILabel = {
        let passwordLbl = UILabel()
        passwordLbl.translatesAutoresizingMaskIntoConstraints = false
        passwordLbl.text = "Password"
        passwordLbl.font =  UIFont.systemFont(ofSize: 14, weight: .bold)
        return passwordLbl
    }()
    
    
    private let tfPassword: UITextField = {
        let tfPassword = UITextField()
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        tfPassword.backgroundColor = .white
        tfPassword.layer.cornerRadius = 6
        tfPassword.attributedPlaceholder = NSAttributedString(
            string: "Enter Password",
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
            ]
        )

     
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfPassword.frame.height))
        tfPassword.leftView = paddingView
        tfPassword.leftViewMode = .always
        
        let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tfPassword.frame.height))
        tfPassword.rightView = rightPaddingView
        tfPassword.rightViewMode = .always
        
        return tfPassword
        
    }()
    
    private let forgotBtn: UIButton = {
        let forgotBtn = UIButton()
        forgotBtn.translatesAutoresizingMaskIntoConstraints = false
        
      
        let attributedTitle = NSAttributedString(
            string: "Forgot Password",
            attributes: [
                .foregroundColor: UIColor.main,
                .font: UIFont.systemFont(ofSize: 10, weight: .regular),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]
        )
        forgotBtn.setAttributedTitle(attributedTitle, for: .normal)
        return forgotBtn
    }()

    
    private let signInBtn: UIButton = {
        let signInBtn = UIButton()
        signInBtn.setTitle("Sign In", for: .normal)
        signInBtn.translatesAutoresizingMaskIntoConstraints = false
        signInBtn.backgroundColor =  UIColor(named: "main")
        signInBtn.layer.cornerRadius = 6
        signInBtn.setTitleColor(.white, for: .normal)
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return signInBtn
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "theme")
        setupScrollView()
        setupCustomView()
        setupSignUpButton()
        setupUserNameLabel()
        setupUserNameTextField()
        setupPasswordLbl()
        setupPasswordTextField()
        setupForgotPassBtn()
        setupSignInBtn()
    }
    
    // Configure Scroll View
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // Configure Custom View
    private func setupCustomView() {
        scrollView.addSubview(customView)
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 127),
            customView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            customView.widthAnchor.constraint(equalToConstant: 279),
            customView.heightAnchor.constraint(equalToConstant: 274)
        ])
    }
    
    // Configure Sign-Up Button
    private func setupSignUpButton() {
        customView.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: -27),
            signUpButton.widthAnchor.constraint(equalToConstant: 185),
            signUpButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        // Add button action
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    // Configure User Name Label
    private func setupUserNameLabel() {
        customView.addSubview(usernameLbl)
        NSLayoutConstraint.activate([
            usernameLbl.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 22),
            usernameLbl.topAnchor.constraint(equalTo: customView.topAnchor, constant: 45)
        ])
    }
    
    // Configure User Name Text Field
    private func setupUserNameTextField() {
        customView.addSubview(tfuserName)
        NSLayoutConstraint.activate([
            tfuserName.topAnchor.constraint(equalTo: usernameLbl.bottomAnchor, constant: 6),
            tfuserName.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 22),
            tfuserName.widthAnchor.constraint(equalToConstant: 235),
            tfuserName.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
    

    
    private func setupPasswordLbl() {
        customView.addSubview(passwordLbl)
        NSLayoutConstraint.activate([
            passwordLbl.topAnchor.constraint(equalTo: tfuserName.bottomAnchor, constant: 10),
            passwordLbl.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 22),
        ])
    }

    
    private func setupPasswordTextField(){
        customView.addSubview(tfPassword)
        NSLayoutConstraint.activate([
            tfPassword.topAnchor.constraint(equalTo:passwordLbl.bottomAnchor , constant: 6),
            tfPassword.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 22),
            tfPassword.widthAnchor.constraint(equalToConstant: 235),
            tfPassword.heightAnchor.constraint(equalToConstant: 36)
            
        ])
    }
    
    private func setupForgotPassBtn() {
        customView.addSubview(forgotBtn)
        NSLayoutConstraint.activate([
            // Position forgotBtn below the password text field
            forgotBtn.topAnchor.constraint(equalTo: tfPassword.bottomAnchor, constant: 6),
            
            // Align forgotBtn to the right of customView with padding
            forgotBtn.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -8),
            
            // Set width and height for forgotBtn
            forgotBtn.widthAnchor.constraint(equalToConstant: 120),
            forgotBtn.heightAnchor.constraint(equalToConstant: 14)
        ])
    }

    
    
    private func setupSignInBtn(){
        customView.addSubview(signInBtn)
        NSLayoutConstraint.activate([
            signInBtn.topAnchor.constraint(equalTo: forgotBtn.bottomAnchor, constant: 12),
            signInBtn.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 20),
            signInBtn.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -20),
            //signInBtn.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
           signInBtn.widthAnchor.constraint(equalToConstant: 235),
            signInBtn.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    // Action for Sign-Up Button
    @objc private func signUpButtonTapped() {
        print("Sign-Up button tapped!")
    }
}

