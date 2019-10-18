//
//  AddTripVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 18/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class AddTripVC: UIViewController {

    @IBOutlet weak var tripHeaderImageView: UIImageView!
    @IBOutlet weak var tripNameTextField: UITextField!
    
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewProperties()
        setViewBackgroundLayout()
    }

    func setupViewProperties() {
        tripHeaderImageView.layer.borderColor = darkPurpleColor.cgColor
        tripHeaderImageView.layer.cornerRadius = 8
        tripHeaderImageView.layer.borderWidth = 2
        
        tripNameTextField.borderStyle = .none
        tripNameTextField.textColor = darkPurpleColor
    }
    
    func setViewBackgroundLayout() {
        //Sets the background image to supplies asset
        if let backgroundImage = UIImage(named: "backgroundImage@3x.png") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            self.view.backgroundColor = .white
        }
    }
    
}
