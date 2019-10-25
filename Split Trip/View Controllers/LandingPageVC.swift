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
        print(CoreDataStack.shared.mainContext)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

        // Do any additional setup after loading the view.
    }
    

    

}
