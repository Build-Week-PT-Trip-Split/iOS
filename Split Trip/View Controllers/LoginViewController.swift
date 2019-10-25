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
   
    // I added this functionality to the `CustomTextField.swift` file so we don't need it here anymore.
    
//    func doneBarBtn() {
//        let toolBar = UIToolbar()
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
//        toolBar.setItems([flexibleSpace,doneButton], animated: false)
//        toolBar.sizeToFit()
//        passwordTextField.inputAccessoryView = toolBar
//
//    }
//
//    @objc func doneClicked() {
//        view.endEditing(true)
//    }
    
    
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
        
        if let email = UsernameTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty {
        
            // Saving to CoreData
            do {
                try CoreDataStack.shared.save()
            } catch {
                NSLog("There was an error saving the User: \(error)")
            }
            
            loginUserController.login(withEmail: email, withPassword: password) { (error) in
                if let error = error {
                    print("Error occured during login: \(error)")
                } else {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "ShowWelcomeBackSegue", sender: self)
                    }
                }
            }
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
