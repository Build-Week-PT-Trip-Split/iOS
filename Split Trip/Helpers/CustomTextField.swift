//
//  CustomTextField.swift
//  Split Trip
//
//  Created by Seschwan on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    let placeholderTextArray = ["Full Name", "Phone Number", "Email Address", "Password"]
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
        setupPlaceholderText()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTextField()
        setupPlaceholderText()
    }

    func setupTextField() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        
        
    }
    
    func setupPlaceholderText() {
        for text in placeholderTextArray {
            attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        }
        switch tag {
        case 0:
            placeholder = placeholderTextArray[0]
        case 1:
            placeholder = placeholderTextArray[1]
        case 2:
            placeholder = placeholderTextArray[2]
        case 3:
            placeholder = placeholderTextArray[3]
        default:
            placeholder = nil
        }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
       
       override func textRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
       
       override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
       
       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
}
