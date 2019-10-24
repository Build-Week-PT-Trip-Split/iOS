//
//  Expenses.swift
//  Split Trip
//
//  Created by Eoin Lavery on 25/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct Expense: Codable {
    var id: Int?
    var expense_name: String
    var total_expense_price: Int
    var primary_paid: String
    var trip_id: Int?
    var created_at: String
    var updated_at: String
}
