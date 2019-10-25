//
//  CreateUser.swift
//  Split Trip
//
//  Created by Seschwan on 10/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    var name: String
    var username: String
    var password: String
    var email: String
}

struct UserLogin: Codable {
    var username: String
    var password: String
}
