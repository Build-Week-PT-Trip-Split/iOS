//
//  SignUpVC.swift
//  Split Trip
//
//  Created by Seschwan on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = nil

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpBtnPressed(_ sender: LoginSignupCustomButton) {
        // Need to create a new user here and check for the values in the text boxes.
        
    }
    

    

}
