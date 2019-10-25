//
//  CreateTripController.swift
//  Split Trip
//
//  Created by Seschwan on 10/24/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class CreateTripController {
    
    enum RequestSetValue: String {
        case applicationJson = "application/json"
        case forHTTPHeaderField = "Content-Type"
    }
    
    func createTrip(name: String, date: String, baseCost: Int, complete: Int, userID: Int, img: String, createdAt: String, updatedAt: String) -> Trip {
        let trip = Trip(name: name, date: date, base_cost: baseCost, complete: complete, user_id: userID, img: img, created_at: createdAt, updated_at: updatedAt)
        return trip
    }
    
    func createTrip(trip: Trip, completion: @escaping (Error?) -> Void) {
        
        var newTripURL = CreateUserController.baseURL
        newTripURL.appendPathComponent("trips")
        
        var request = URLRequest(url: newTripURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue(RequestSetValue.applicationJson.rawValue, forHTTPHeaderField: RequestSetValue.forHTTPHeaderField.rawValue)
        
        let jsonEncoder = JSONEncoder()
        
        do {
            
            let jsonData = try jsonEncoder.encode(trip)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
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

