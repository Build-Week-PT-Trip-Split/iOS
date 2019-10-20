//
//  AddTripSettingsTableViewCell.swift
//  Split Trip
//
//  Created by Eoin Lavery on 19/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class TripSettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var settingTypeImage: UIImageView!
    @IBOutlet weak var settingTitleLabel: UILabel!
    @IBOutlet weak var settingValueLabel: UILabel!
    
    let cellBackgroundGrayColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1.0)
    let cellTextColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    let cellValueColor = UIColor(red:0.42, green:0.15, blue:1.00, alpha:1.0)
    
    var selectedTripSetting: TripSetting? {
        didSet {
            updateViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.backgroundColor = cellBackgroundGrayColor
        bgView.layer.cornerRadius = 8
        settingTitleLabel.textColor = cellTextColor
        settingValueLabel.textColor = cellValueColor
        updateViews()
    }

    func updateViews() {
        guard let selectedTripSetting = selectedTripSetting else { return }
        
        settingTitleLabel.text = selectedTripSetting.settingName
        
        if let settingImage = selectedTripSetting.settingImage,
            let settingValue = selectedTripSetting.settingValueString {
            settingTypeImage.image = settingImage
            settingValueLabel.text = settingValue
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
