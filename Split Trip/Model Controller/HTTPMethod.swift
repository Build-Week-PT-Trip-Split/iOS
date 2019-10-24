//
//  HTTPMethod.swift
//  Split Trip
//
//  Created by Eoin Lavery on 24/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

//HTTPMethod enum to store HTTP Request types in rawValue values.
enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}
