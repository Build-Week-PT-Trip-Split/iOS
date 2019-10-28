//
//  WelcomeBackViewController.swift
//  Split Trip
//
//  Created by Bobby Keffury on 10/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class WelcomeBackViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var welcomeBackImageView: UIImageView!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    let user = CurrentUser.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = user.name {
            welcomeBackLabel.text = "Welcome back, \(name)!"
        }
    }

}
