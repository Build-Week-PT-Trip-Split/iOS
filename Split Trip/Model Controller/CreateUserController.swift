//
//  CreateUserController.swift
//  Split Trip
//
//  Created by Seschwan on 10/21/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class CreateUserController {
    
    static let baseURL = URL(string: "https://tripsplitr.herokuapp.com")!
    
    enum HTTPMethod: String {
        case get    = "GET"
        case put    = "PUT" // Update data - Will fail if data doens't exist
        case post   = "POST"  // Create data - frowned upon if used to update data although it can.
        case delete = "DELETE" // Delete data -
    }
    
    func createUser() {
        
    }
}
