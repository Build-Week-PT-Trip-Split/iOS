//
//  NotificationsVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 18/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class NotificationsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackgroundLayout()
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
