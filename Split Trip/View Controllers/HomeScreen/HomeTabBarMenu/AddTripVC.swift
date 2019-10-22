//
//  AddTripVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 18/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class AddTripVC: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var tripHeaderImageView: UIImageView!
    @IBOutlet weak var tripNameTextField: UITextField!
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
    let greenColor = UIColor(red:0.07, green:0.96, blue:0.74, alpha:1.0)
    
    //MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        participantCollectionView.dataSource = self
        tripNameTextField.delegate = self
        setupViewProperties()
        registerParticipantCollectionViewCells()
        configureTripItemViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    //MARK: - PRIVATE FUNCTIONS
    func setupViewProperties() {
        //Configure tripHeaderImageView Layout
        tripHeaderImageView.layer.borderColor = darkPurpleColor.cgColor
        tripHeaderImageView.layer.cornerRadius = 8
        tripHeaderImageView.layer.borderWidth = 2
        tripHeaderImageView.image = UIImage(named: "ChooseImagePlaceholder")

        //Configure tripNameTextField Layout
        tripNameTextField.borderStyle = .none
        tripNameTextField.textColor = darkPurpleColor
        
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
    
}

//MARK: - UICOLLECTIONVIEW DATA SOURCE
extension AddTripVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = participantCollectionView.dequeueReusableCell(withReuseIdentifier: "ParticipantCell", for: indexPath) as? ParticipantCollectionViewCell else { return UICollectionViewCell()}
        
        cell.participantNameLabel.text = "Participant"
        
        return cell
    }
    
}

//MARK: - UITEXTFIELD DELEGATE
extension AddTripVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
