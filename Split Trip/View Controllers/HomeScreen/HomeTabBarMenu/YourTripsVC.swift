//
//  YourTripsVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 17/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class YourTripsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

}
