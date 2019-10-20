//
//  TripSettings.swift
//  Split Trip
//
//  Created by Eoin Lavery on 19/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation
import UIKit

enum TripSettingType {
    case date
    case destination
    case expenses
    case totalSpend
}

struct TripSetting {
    var settingImage: UIImage?
    var settingName: String
    var settingValueString: String?
    var tripSettingType: TripSettingType
}

class TripSettingConfiguration {
    
    var tripSettings: [TripSetting] = []
    
    var tripDateSetting: TripSetting
    var tripDestinationSetting: TripSetting
    var tripExpensesSetting: TripSetting
    var totalSpentSetting: TripSetting
    
    //UIColors for use within UI
    let darkPurpleColor = UIColor(red:0.22, green:0.08, blue:0.36, alpha:1.0)
    
    init() {
        
        let dateIcon = UIImage(systemName: "calendar.badge.plus")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        let destinationIcon = UIImage(systemName: "map")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        let expensesIcon = UIImage(systemName: "dollarsign.square")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        let totalSpentIcon = UIImage(systemName: "creditcard")?.withTintColor(darkPurpleColor, renderingMode: .alwaysOriginal)
        
        tripDateSetting = TripSetting(settingImage: dateIcon, settingName: "Date", settingValueString: "", tripSettingType: .date)
        tripDestinationSetting = TripSetting(settingImage: destinationIcon, settingName: "Destination", settingValueString: "", tripSettingType: .destination)
        tripExpensesSetting = TripSetting(settingImage: expensesIcon, settingName: "Trip Expenses", settingValueString: "", tripSettingType: .expenses)
        totalSpentSetting = TripSetting(settingImage: totalSpentIcon, settingName: "Total Spent", settingValueString: "", tripSettingType: .totalSpend)
        
        tripSettings.append(tripDateSetting)
        tripSettings.append(tripDestinationSetting)
        tripSettings.append(tripExpensesSetting)
        tripSettings.append(totalSpentSetting)
    }
    
}
