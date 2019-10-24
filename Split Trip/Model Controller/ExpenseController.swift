//
//  ExpenseController.swift
//  Split Trip
//
//  Created by Eoin Lavery on 25/10/2019.
//  Copyright © 2019 Seschwan. All rights reserved.
//
import Foundation

class ExpenseController {
    
    //MARK: - PROPERTIES
    let baseURL = URL(string: "https://tripsplitr.herokuapp.com")
    var expenseResults: [Expense] = []
    
    //MARK: - PUBLIC FUNCTIONS
    func loadExpensesFromOnlineStore(completion: @escaping (Error?) -> Void) {
     
        guard let baseURL = baseURL?.appendingPathComponent("/expenses") else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: baseURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            
            if let error = error {
                print("Error loading Expenses: \(error)")
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
                let trips = try jsonDecoder.decode([Expense].self, from: data)
                self.expenseResults = trips
                completion(nil)
                print("Expenses Found")
            } catch {
                print("Error decoding Expenses data: \(error)")
                completion(error)
                return
            }
            
            completion(nil)
        }.resume()
        
    }
    
}
