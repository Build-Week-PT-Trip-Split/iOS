//
//  ViewTripVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 19/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class ViewTripVC: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var tripsTableView: UITableView!
    @IBOutlet weak var yourTripsLabel: UILabel!
    @IBOutlet weak var newTripButton: UIButton!
    
    //MARK: - PROPERTIES
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    
    //MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackgroundLayout()
        registerTripTableViewCells()
        setupViewProperties()
        tripsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Determines if TripsTableView requires scrolling, and if not, scrolling is disabled
        tripsTableView.alwaysBounceVertical = false
    }

    //MARK: - PRIVATE FUNCTIONS
    func setupViewProperties() {
        //Configures "Your Trips" label text color
        yourTripsLabel.textColor = darkPurpleColor
        
        //Configures "New Trip" button text color
        newTripButton.setTitleColor(darkPurpleColor, for: .normal)
        
        //Removes separation lines in UITableView
        tripsTableView.separatorStyle = .none
    }
    
    func setViewBackgroundLayout() {
        //Sets the background image to supplied asset
        if let backgroundImage = UIImage(named: "backgroundImage@3x.png") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    func registerTripTableViewCells() {
        //Registers custom UITableViewCell for use in TripsTableView
        let cell = UINib(nibName: "TripTableViewCell", bundle: nil)
        self.tripsTableView.register(cell, forCellReuseIdentifier: "TripCell")
    }
    
}

//MARK: - UITABLEVIEW DATASOURCE
extension ViewTripVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tripsTableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as? TripTableViewCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        
        cell.tripTitleLabel.text = "My First Trip"
        
        return cell
    }
    
    
}
