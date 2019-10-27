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
    
    //MARK: - Properties
    
    //MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Starting Segue")
        if segue.identifier == "ShowHomeScreenSegue" {
            print("Segue Identified")
            if let destinationVC = segue.destination as? YourTripsVC {
                    print("YourTripsVC found")

                }
        }
    }

}
