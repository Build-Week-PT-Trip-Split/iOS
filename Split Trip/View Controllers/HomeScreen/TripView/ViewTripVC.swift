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
    @IBOutlet weak var tripHeaderImageView: UIImageView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var withLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    @IBOutlet weak var addParticipantButton: UIButton!
    @IBOutlet weak var participantCollectionView: UICollectionView!
    
    @IBOutlet weak var dateItemImageView: UIImageView!
    @IBOutlet weak var dateItemTitleLabel: UILabel!
    @IBOutlet weak var dateItemButton: UIButton!
    @IBOutlet weak var destinationItemImageView: UIImageView!
    @IBOutlet weak var destinationItemTitleLabel: UILabel!
    @IBOutlet weak var destinationItemButton: UIButton!
    @IBOutlet weak var expensesItemImageView: UIImageView!
    @IBOutlet weak var expensesItemTitleLabel: UILabel!
    @IBOutlet weak var expensesItemButton: UIButton!
    @IBOutlet weak var totalSpentItemImageView: UIImageView!
    @IBOutlet weak var totalSpentTitleLabel: UILabel!
    @IBOutlet weak var totalSpentButton: UIButton!
    @IBOutlet weak var dateViewBG: UIView!
    @IBOutlet weak var destinationViewBG: UIView!
    @IBOutlet weak var expensesViewBG: UIView!
    @IBOutlet weak var totalSpentBG: UIView!
    
    //MARK: - PROPERTIES
    //UIColors for use within UI
    let lightGrayColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
    let lightPurpleColor = UIColor(red:0.42, green:0.15, blue:1.00, alpha:1.0)
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    
    let expenseController = ExpenseController()
    let tripController = TripController()
    var tripExpenses: [Expense] = []
    var trip: Trip?
    var totalTripCost: Int = 0
    
    //MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        participantCollectionView.dataSource = self
        setupViewProperties()
        registerParticipantCollectionViewCells()
        configureTripItemViews()
        getTotalTripCosts()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //MARK: - PRIVATE FUNCTIONS
    
    func updateViews() {
        guard let trip = trip else { return }
        tripNameLabel.text = trip.name
        dateItemButton.setTitle(trip.date, for: .normal)
        destinationItemButton.setTitle(trip.name, for: .normal)
    }
    
    func getTotalTripCosts(){
        guard let trip = trip, let tripId = trip.id else { return }
        
        expenseController.loadExpensesFromOnlineStore(tripId: Int(tripId), completion: { error in
            if let error = error {
                print("Error getting Trip Expenses: \(error)")
            }
            
            self.tripExpenses = self.expenseController.tripExpenseResults
            self.totalTripCost = Int(trip.base_cost)
            
            for expense in self.tripExpenses {
                self.totalTripCost += expense.total_expense_price
            }
            
            DispatchQueue.main.async {
                self.totalSpentButton.setTitle(String(self.totalTripCost), for: .normal)
            }
            
        })
    }
    
    func setupViewProperties() {
        //Configure tripHeaderImageView Layout
        tripHeaderImageView.layer.borderColor = darkPurpleColor.cgColor
        tripHeaderImageView.layer.cornerRadius = 8
        tripHeaderImageView.layer.borderWidth = 2
        tripHeaderImageView.image = UIImage(named: "ChooseImagePlaceholder")

        //Configure tripNameLabel and withLabel Layout
        tripNameLabel.textColor = darkPurpleColor
        withLabel.textColor = darkPurpleColor
        
        //Configure participantsLabel and button Layout
        participantsLabel.textColor = darkPurpleColor
        addParticipantButton.setTitleColor(darkPurpleColor, for: .normal)
        addParticipantButton.contentHorizontalAlignment = .right
    }
    
    func registerParticipantCollectionViewCells() {
        //Registers custom UICollectionViewCell for use in ParticipantsCollectionView
        let cell = UINib(nibName: "ParticipantCollectionViewCell", bundle: nil)
        self.participantCollectionView.register(cell, forCellWithReuseIdentifier: "ParticipantCell")
    }
    
    func configureTripItemViews() {
        let dateIcon = UIImage(systemName: "calendar.badge.plus")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        let destinationIcon = UIImage(systemName: "map")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        let expensesIcon = UIImage(systemName: "dollarsign.square")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        let totalSpentIcon = UIImage(systemName: "creditcard")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        
        dateItemImageView.image = dateIcon
        dateItemTitleLabel.textColor = darkPurpleColor
        dateItemButton.setTitleColor(darkPurpleColor, for: .normal)
        dateViewBG.backgroundColor = lightGrayColor
        dateViewBG.layer.cornerRadius = 8
        
        destinationItemImageView.image = destinationIcon
        destinationItemTitleLabel.textColor = darkPurpleColor
        destinationItemButton.setTitleColor(darkPurpleColor, for: .normal)
        destinationViewBG.backgroundColor = lightGrayColor
        destinationViewBG.layer.cornerRadius = 8
        
        expensesItemImageView.image = expensesIcon
        expensesItemTitleLabel.textColor = darkPurpleColor
        expensesItemButton.setTitleColor(darkPurpleColor, for: .normal)
        expensesViewBG.backgroundColor = lightGrayColor
        expensesViewBG.layer.cornerRadius = 8
        
        totalSpentItemImageView.image = totalSpentIcon
        totalSpentTitleLabel.textColor = darkPurpleColor
        totalSpentButton.setTitleColor(darkPurpleColor, for: .normal)
        totalSpentBG.backgroundColor = lightGrayColor
        totalSpentBG.layer.cornerRadius = 8
    }
    
    @IBAction func saveTripTapped(_ sender: Any) {
        guard var trip = trip, let name = tripNameLabel.text, let date = dateItemButton.titleLabel?.text, let destination = destinationItemButton.titleLabel?.text, let baseCost = Int16(totalSpentButton.titleLabel!.text!) else { return }
        
        trip.name = name
        trip.date = date
        trip.base_cost = baseCost
        trip.destination = destination
        
        
        
        self.tripController.editTrip(with: trip)
        
        let savedAlert = UIAlertController(title: "Trip Updated", message: "Your trip was updated!", preferredStyle: .alert)
        savedAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil)
        }))
    }
    
    @IBAction func deleteTripTapped(_ sender: Any) {
        
        guard let trip = trip else { return }
        
        let deleteAlert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip?", preferredStyle: .alert)

        deleteAlert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action: UIAlertAction!) in
            self.tripController.deleteTrip(with: trip)
        }))

        deleteAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            self.dismiss(animated: true, completion: nil) // NOT SURE ABOUT THIS
        }))

        present(deleteAlert, animated: true, completion: nil)
    }
    
    
    //MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetExpensesSegue" {
            guard let expensesVC = segue.destination as? ExpensesVC,
                let trip = trip else { return }
            expensesVC.trip = trip
        }
        
    }
    
    
    
}

//MARK: - UICOLLECTIONVIEW DATA SOURCE
extension ViewTripVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = participantCollectionView.dequeueReusableCell(withReuseIdentifier: "ParticipantCell", for: indexPath) as? ParticipantCollectionViewCell else { return UICollectionViewCell()}
        
        cell.participantNameLabel.text = "Participant"
        
        return cell
    }
    
}
