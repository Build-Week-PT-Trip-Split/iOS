//
//  LoginViewController.swift
//  Split Trip
//
//  Created by Bobby Keffury on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

 }
    
    private func updateViews() {
        
        loginButton.layer.cornerRadius = 12
        loginButton.backgroundColor = .purple
        loginButton.titleLabel?.textColor = .white
        
        emailAddressTextField.backgroundColor = .clear
        emailAddressTextField.layer.borderColor = UIColor.white.cgColor
        emailAddressTextField.layer.borderWidth = 1.0
        emailAddressTextField.layer.cornerRadius = 5.0

        
        passwordTextField.backgroundColor = .clear
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 5.0
        
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
