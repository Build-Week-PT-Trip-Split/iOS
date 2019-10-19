//
//  LoginSignupCustomButton.swift
//  Split Trip
//
//  Created by Seschwan on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class LoginSignupCustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
   
    func setupButton() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = layer.frame.height / 2
        
    }

}
