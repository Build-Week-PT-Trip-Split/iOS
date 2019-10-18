//
//  LandingPageVC.swift
//  Split Trip
//
//  Created by Seschwan on 10/15/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class LandingPageVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var bGImageView: UIImageView!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStyling()
       

        // Do any additional setup after loading the view.
    }
    func buttonStyling() {
        let borderWidth = CGFloat(1)
        let borderColor = UIColor.white.cgColor
        
        
        logInBtn.layer.borderColor = borderColor
        signUpBtn.layer.borderColor = borderColor
        
        logInBtn.layer.borderWidth = borderWidth
        signUpBtn.layer.borderWidth = borderWidth
        
        logInBtn.layer.cornerRadius = logInBtn.frame.height / 2
        signUpBtn.layer.cornerRadius = signUpBtn.frame.height / 2
    }

    

}
