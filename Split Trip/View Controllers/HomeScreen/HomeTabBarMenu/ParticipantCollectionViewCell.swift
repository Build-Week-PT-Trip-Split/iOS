//
//  ParticipantCollectionViewCell.swift
//  Split Trip
//
//  Created by Eoin Lavery on 18/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class ParticipantCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var participantImage: UIImageView!
    @IBOutlet weak var participantNameLabel: UILabel!
    
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        participantNameLabel.textColor = darkPurpleColor
        participantImage.layer.cornerRadius = participantImage.frame.height/2
        participantImage.layer.borderWidth = 2
        participantImage.layer.borderColor = darkPurpleColor.cgColor
    }

}
