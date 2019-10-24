//
//  ParticipantDetailVC.swift
//  Split Trip
//
//  Created by Eoin Lavery on 21/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class ParticipantDetailVC: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var participantViewBG: UIView!
    @IBOutlet weak var participantImageView: UIImageView!
    @IBOutlet weak var participantNameLabel: UILabel!
    @IBOutlet weak var participantValueOwedLabel: UILabel!
    @IBOutlet weak var tripTableView: UITableView!
    @IBOutlet weak var participantExpensesTitleLabel: UILabel!
    @IBOutlet weak var participantExpensesTableView: UITableView!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var payButton: UIButton!
    
    //MARK: - PROPERTIES
    let grayBGColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    let lightPurpleColor = UIColor(red:0.42, green:0.15, blue:1.00, alpha:1.0)
    let greenColor = UIColor(red:0.07, green:0.96, blue:0.74, alpha:1.0)
    
    //MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewLayout()
    }
    
    //MARK: - PRIVATE FUNCTIONS
    func configureViewLayout() {
        participantViewBG.backgroundColor = grayBGColor
        participantViewBG.layer.cornerRadius = 8
        participantImageView.layer.cornerRadius = participantImageView.frame.height / 2
        participantImageView.layer.borderColor = darkPurpleColor.cgColor
        participantImageView.layer.borderWidth = 2
        participantNameLabel.textColor = darkPurpleColor
        participantValueOwedLabel.textColor = darkPurpleColor
        participantExpensesTitleLabel.textColor = darkPurpleColor
        requestButton.backgroundColor = greenColor
        requestButton.layer.cornerRadius = requestButton.frame.height / 2
        requestButton.layer.borderColor = darkPurpleColor.cgColor
        requestButton.layer.borderWidth = 2
        payButton.backgroundColor = greenColor
        payButton.layer.cornerRadius = payButton.frame.height / 2
        payButton.layer.borderColor = darkPurpleColor.cgColor
        payButton.layer.borderWidth = 2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
