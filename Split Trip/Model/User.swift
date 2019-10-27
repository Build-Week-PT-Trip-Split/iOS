//
//  CreateUser.swift
//  Split Trip
//
//  Created by Seschwan on 10/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

struct UserRepresentation: Codable {
    var id: Int
    var name: String
    var username: String
    var password: String
    var email: String
}

struct UserLogin: Codable {
    var username: String
    var password: String
}

struct UserResult: Codable {
    var user: UserRoot
}

struct UserRoot: Codable {
    var id: Int?
    var name: String?
    var username: String
    var password: String
    var email: String?
}

class CurrentUser {
    
    static let shared = CurrentUser()
    
    var id: Int?
    var name: String?
    var username: String?
    var password: String?
    var email: String?
    
    func assignCurrentUser(id: Int, name: String, username: String, password: String, email: String) {
        CurrentUser.shared.id = id
        CurrentUser.shared.name = name
        CurrentUser.shared.username = username
        CurrentUser.shared.password = password
        CurrentUser.shared.email = email
    }
}
