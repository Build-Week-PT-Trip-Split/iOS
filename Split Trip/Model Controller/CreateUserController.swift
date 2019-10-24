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
    
    enum RequestSetValue: String {
        case applicationJson = "application/json"
        case forHTTPHeaderField = "Content-Type"
    }
    
    func createUser(name: String, username: String, password: String, email: String) -> User {
        let user = User(name: name, username: username, password: password, email: email)
        return user
    }
    
    func signUpNewUser(user: User, completion: @escaping (Error?) -> Void) {
        
        var newUserURL = CreateUserController.baseURL
        newUserURL.appendPathComponent("auth/register")
        
        var request = URLRequest(url: newUserURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue(RequestSetValue.applicationJson.rawValue, forHTTPHeaderField: RequestSetValue.forHTTPHeaderField.rawValue)
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
        }.resume()
        
    }
}
