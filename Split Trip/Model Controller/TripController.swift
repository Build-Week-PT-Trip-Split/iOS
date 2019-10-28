//
//  TripController.swift
//  Split Trip
//
//  Created by Eoin Lavery on 24/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class TripController {
    
    //MARK: - PROPERTIES
    let baseURL = URL(string: "https://tripsplitr.herokuapp.com")
    var tripsResults: [Trip] = []
    var tripsForUser: [Trip] = []
    
    //MARK: - PUBLIC FUNCTIONS
    func loadTripsFromOnlineStore(userId: Int, completion: @escaping (Error?) -> Void) {
     
        guard let baseURL = baseURL?.appendingPathComponent("/trips") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                print("Error loading Trips: \(error)")
                completion(error)
                return
            }
            
            guard let data = data else {
                print("Data Not Found")
                completion(error)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let trips = try jsonDecoder.decode([Trip].self, from: data)
                self.tripsResults = trips
                self.sortTripsForUser(userId: userId)
                completion(nil)
            } catch {
                print("Error decoding Trips data: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
        
    }
    
    func sortTripsForUser(userId: Int){
        tripsForUser = []
        for trip in tripsResults {
            if trip.user_id == userId {
                tripsForUser.append(trip)
            }
        }
    }
    
    func editTrip(with trip: Trip, completion: @escaping (Error?) -> Void = { _ in }) {
        guard let id = trip.id, let baseUrl = baseURL?.appendingPathComponent("trips/\(id)") else { return }
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = HTTPMethod.put.rawValue
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(trip)
            request.httpBody = jsonData
        } catch {
            print("Error encoding edited trip: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
                   
            if let error = error {
                print("Error PUTting trip to server: \(error)")
                completion(error)
                return
            }
            
            if let response = response {
                print("Error received from server: \(response)")
            }
                   
            completion(nil)
        }.resume()
    }
    
    func deleteTrip(with trip: Trip, completion: @escaping (Error?) -> Void = { _ in }) {
        guard let id = trip.id, let baseUrl = baseURL?.appendingPathComponent("trips/\(id)") else { return }
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = HTTPMethod.delete.rawValue
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            print("Deleted entry with ID: \(id)")
            
            completion(error)
        }.resume()
    }
    
    func addNewTrip(trip: Trip, completion: @escaping (Error?) -> Void) {
        
        guard let baseURL = baseURL?.appendingPathComponent("/trips") else { return }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue(RequestSetValue.applicationJson.rawValue, forHTTPHeaderField: RequestSetValue.forHTTPHeaderField.rawValue)
        
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(trip)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding trip object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse,
            response.statusCode != 201 && response.statusCode != 200 {
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
