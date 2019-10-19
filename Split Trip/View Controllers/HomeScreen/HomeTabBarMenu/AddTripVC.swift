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
    @IBOutlet weak var tripSettingsTableView: UITableView!
    
    
    //MARK: - PROPERTIES
    //UIColors for use within UI
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    
    //TripSetting objects to populate tripSettingsTableView
    let tripDateSetting = TripSetting(settingImage: nil, settingName: "Date", settingValueString: "")
    let tripDestinationSetting = TripSetting(settingImage: nil, settingName: "Destination", settingValueString: "")
    let tripExpensesSetting = TripSetting(settingImage: nil, settingName: "Trip Expenses", settingValueString: "")
    let totalSpentSetting = TripSetting(settingImage: nil, settingName: "Total Spent", settingValueString: "")
    
    var tripSettingsArray: [TripSetting] = []
 
    
    //MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        tripSettingsTableView.dataSource = self
        participantCollectionView.dataSource = self
        tripNameTextField.delegate = self
        setupViewProperties()
        setViewBackgroundLayout()
        registerParticipantCollectionViewCells()
        registerSettingTableViewCell()
        populateTripSettingsArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Determines if TripsTableView requires scrolling, and if not, scrolling is disabled
        tripSettingsTableView.alwaysBounceVertical = false
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
        
        //Removes line separator from tripSettingsTableView's cells
        tripSettingsTableView.separatorStyle = .none
    }
    
    func setViewBackgroundLayout() {
        //Sets the background image to supplies asset
        if let backgroundImage = UIImage(named: "backgroundImage@3x.png") {
            self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    func registerParticipantCollectionViewCells() {
        //Registers custom UICollectionViewCell for use in ParticipantsCollectionView
        let cell = UINib(nibName: "ParticipantCollectionViewCell", bundle: nil)
        self.participantCollectionView.register(cell, forCellWithReuseIdentifier: "ParticipantCell")
    }
    
    func registerSettingTableViewCell() {
        //Registers custom UITableViewCell for use in TripSettingsTableView
        let cell = UINib(nibName: "AddTripSettingsTableViewCell", bundle: nil)
        self.tripSettingsTableView.register(cell, forCellReuseIdentifier: "SettingCell")
    }

    func populateTripSettingsArray() {
        tripSettingsArray.append(tripDateSetting)
        tripSettingsArray.append(tripDestinationSetting)
        tripSettingsArray.append(tripExpensesSetting)
        tripSettingsArray.append(totalSpentSetting)
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

//MARK: - UITABLEVIEW DATA SOURCE
extension AddTripVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripSettingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tripSettingsTableView.dequeueReusableCell(withIdentifier: "SettingCell") as? AddTripSettingsTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        cell.selectedTripSetting = tripSettingsArray[indexPath.row]
        
        return cell
    }
    
    
}
