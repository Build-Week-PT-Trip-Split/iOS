//
//  LoginViewController.swift
//  Split Trip
//
//  Created by Bobby Keffury on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    //MARK: - Properties
    
    private var showHideButton: UIButton = UIButton()
    private let showImage = UIImage(named: "EyeShow")
    private let hideImage = UIImage(named: "EyeClose")
    var loginUserController = LoginUserController()
    let user = CurrentUser.shared
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        checkUsername()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkUsername()
    }
    
    //MARK: - Functions
    
    @objc func showHideTapped() {
        if showHideButton.currentImage == showImage {
            showHideButton.setImage(hideImage, for: .normal)
            passwordTextField.isSecureTextEntry = true
        } else {
            showHideButton.setImage(showImage, for: .normal)
            passwordTextField.isSecureTextEntry = false
        }
    }
    
    
    private func updateViews() {

        UsernameTextField.backgroundColor = .clear
        UsernameTextField.layer.borderColor = UIColor.white.cgColor
        UsernameTextField.layer.borderWidth = 2.0
        UsernameTextField.layer.cornerRadius = 5.0
        UsernameTextField.textColor = .white


        passwordTextField.backgroundColor = .clear
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 2.0
        passwordTextField.layer.cornerRadius = 5.0
        passwordTextField.textColor = .white
        passwordTextField.rightView = showHideButton
        passwordTextField.rightViewMode = .always
        
        showHideButton.setImage(hideImage, for: .normal)
        showHideButton.translatesAutoresizingMaskIntoConstraints = false
        showHideButton.addTarget(self, action: #selector(showHideTapped), for: .touchUpInside)
        showHideButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        showHideButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
       
        
        //doneBarBtn()
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if let username = UsernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty {
                
                // Saving to CoreData
                do {
                    try CoreDataStack.shared.save()
                } catch {
                    NSLog("There was an error saving the User: \(error)")
                }
                
                loginUserController.login(withEmail: username, withPassword: password) { (error, loginData) in
                    if let error = error {
                        print("Error occured during login: \(error)")
                    }
                    
                    guard let loginData = loginData,
                        let id = loginData.user.id,
                        let name = loginData.user.name,
                        let email = loginData.user.email else {
                        print("No Login Data Found.")
                        return
                    }
                    
                    self.user.assignCurrentUser(id: id, name: name, username: loginData.user.username, password: loginData.user.password, email: email)
                    
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "WelcomeBackScreen", bundle: nil)
                        let welcomeBackStoryboard = storyboard.instantiateInitialViewController()!
                        welcomeBackStoryboard.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                        self.present(welcomeBackStoryboard, animated: true, completion: nil)
                    }
                }
        } else {
            let loginErrorAlert = UIAlertController(title: "Login Unsuccessful", message: "Could not log in with entered details. Make sure details are valid and try again.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            loginErrorAlert.addAction(action)
            present(loginErrorAlert, animated: true, completion: nil)
            return
        }
    }
    
    // MARK: - Checking CoreData to see if there is a Username and Password
    func checkUsername() {
        if let userName = loginUserController.fetchUser()?.username,
            let password = loginUserController.fetchUser()?.password {
            
            UsernameTextField.text = userName
            passwordTextField.text = password
        } else {
            UsernameTextField.text = ""
            passwordTextField.text = ""
        }
    }

}
