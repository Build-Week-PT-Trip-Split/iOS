//
//  Trip.swift
//  Split Trip
//
//  Created by Eoin Lavery on 24/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct Trip: Codable {
    var id: Int16?
    var name: String
    var date: String
    var base_cost: Int32
    var complete: Int16?
    var user_id: Int16
    var img: String?
    var created_at: String?
    var updated_at: String?
}

struct TripSearch: Codable {
    let results: [Trip]
}
