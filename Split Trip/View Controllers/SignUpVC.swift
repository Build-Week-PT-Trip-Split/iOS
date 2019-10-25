//
//  SignUpVC.swift
//  Split Trip
//
//  Created by Seschwan on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    let createUserController = CreateUserController()
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = nil

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: LoginSignupCustomButton) {
        // Need to create a new user here and check for the values in the text boxes.
        guard let name = nameTextField.text, !name.isEmpty,
            let username = usernameTextField.text, !username.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty else { return }
        
        let user = createUserController.createUser(name: name, username: username, password: password, email: email)
        
        do {
            try CoreDataStack.shared.save()
        } catch {
            NSLog("There was an error saving the User: \(error)")
        }
        
        createUserController.signUpNewUser(user: user, completion: { (error) in
            if let error = error {
                NSLog("Error creating a new user: \(error)")
                return
            }
        })
        
    }
    

    

}
