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
        for trip in tripsResults {
            if trip.user_id == userId {
                tripsForUser.append(trip)
            }
        }
    }
    
    func editTrip(with trip: Trip) {
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.save()
        } catch {
            print("Error Editing trip: \(error)")
        }
    }
    
    func deleteTrip(with trip: Trip) {
        let moc = CoreDataStack.shared.mainContext
        do {
            try moc.delete(trip)
        } catch {
            print("Error Deleting trip: \(error)")
        }
    }
    
}
