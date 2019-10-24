//
//  TripTableViewCell.swift
//  Split Trip
//
//  Created by Eoin Lavery on 18/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var tripTypeImage: UIImageView!
    @IBOutlet weak var tripTitleLabel: UILabel!
    @IBOutlet weak var tripDateLabel: UILabel!
    
    var trip: Trip? {
        didSet {
            updateViews()
        }
    }
    
    let cellBackgroundGrayColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
    let cellTextColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    let cellValueColor = UIColor(red:0.42, green:0.15, blue:1.00, alpha:1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.backgroundColor = cellBackgroundGrayColor
        bgView.layer.cornerRadius = 8
        tripTitleLabel.textColor = cellTextColor
        tripDateLabel.textColor = cellValueColor
    }
    
    func updateViews() {
        guard let trip = trip else { return }
        tripTitleLabel.text = trip.name
        tripDateLabel.text = trip.date
    }
    
}
