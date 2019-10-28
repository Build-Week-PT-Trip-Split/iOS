//
//  YourTripsVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 17/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class YourTripsVC: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var tripsTableView: UITableView!
    @IBOutlet weak var yourTripsLabel: UILabel!
    @IBOutlet weak var newTripButton: UIButton!
    @IBOutlet weak var getStartedLabel: UILabel!
    
    //MARK: - PROPERTIES
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    let tripController = TripController()
    var tripSearchResults: [Trip] = []
    var user = CurrentUser.shared
    
    //MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTripTableViewCells()
        setupViewProperties()
        tripsTableView.dataSource = self
        tripsTableView.delegate = self
        loadTrips()
        
        if let name = user.name {
            print(name)
        } else {
            print("No Name Found")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tripsTableView.alwaysBounceVertical = false
        tripsTableView.reloadData()
        
    }

    //MARK: - PRIVATE FUNCTIONS
    
    func loadTrips() {
        guard let id = user.id else { return }
        tripController.loadTripsFromOnlineStore(userId: id, completion: { error in
            if let error = error {
                print("Unable to request trips: \(error)")
            } else {
                DispatchQueue.main.async {
                    self.tripSearchResults = self.tripController.tripsForUser
                    self.tripsTableView.reloadData()
                    if self.tripSearchResults.count == 0 {
                        self.getStartedLabel.isHidden = false
                    } else {
                        self.getStartedLabel.isHidden = true
                    }
                }
            }
        })
    }
    
    func setupViewProperties() {
        //Configures "Your Trips" label text color
        yourTripsLabel.textColor = darkPurpleColor
        getStartedLabel.textColor = darkPurpleColor
        
        //Configures "New Trip" button text color
        newTripButton.setTitleColor(darkPurpleColor, for: .normal)
        
        //Removes separation lines in UITableView
        tripsTableView.separatorStyle = .none
    }
    
    func registerTripTableViewCells() {
        //Registers custom UITableViewCell for use in TripsTableView
        let cell = UINib(nibName: "TripTableViewCell", bundle: nil)
        self.tripsTableView.register(cell, forCellReuseIdentifier: "TripCell")
    }
    
    //MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewTripSegue" {
            guard let viewTripVC = segue.destination as? ViewTripVC,
                let selectedIndexPath = tripsTableView.indexPathForSelectedRow else { return }
            viewTripVC.trip = tripSearchResults[selectedIndexPath.row]
            viewTripVC.delegate = self
            viewTripVC.updateDelegate = self
        }
        
        if segue.identifier == "AddTripSegue" {
            guard let addTripVC = segue.destination as? AddTripVC  else { return }
            addTripVC.delegate = self
        }
        
    }
    
}

//MARK: - UITABLEVIEW DATASOURCE
extension YourTripsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tripsTableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as? TripTableViewCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        
        cell.trip = tripSearchResults[indexPath.row]
        
        return cell
    }
    
}

//MARK: - UITABLEVIEW DELEGATE
extension YourTripsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ViewTripSegue", sender: TripTableViewCell.self)
        tripsTableView.deselectRow(at: indexPath, animated: false)
        let _ = tripsTableView.cellForRow(at: indexPath) as? TripTableViewCell
    }
    
}

extension YourTripsVC: AddTripDelegate {
    func tripWasAdded() {
        dismiss(animated: true, completion: nil)
        loadTrips()
        tripsTableView.reloadData()
    }
}

extension YourTripsVC: DeleteTripDelegate {
    func tripWasDeleted() {
        navigationController?.popViewController(animated: true)
        loadTrips()
        tripsTableView.reloadData()
    }
}

extension YourTripsVC: UpdateTripDelegate {
    func tripWasUpdated() {
        navigationController?.popViewController(animated: true)
        loadTrips()
        tripsTableView.reloadData()
    }
}
