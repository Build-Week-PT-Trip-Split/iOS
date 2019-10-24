//
//  LoginUserController.swift
//  Split Trip
//
//  Created by Bobby Keffury on 10/22/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation

class LoginUserController {
    
    static let baseURL = URL(string: "https://tripsplitr.herokuapp.com")!
    typealias CompletionHandler = (Error?) -> Void
    
    var createUserController = CreateUserController()
       
       enum HTTPMethod: String {
           case get    = "GET"
           case put    = "PUT"
           case post   = "POST"
           case delete = "DELETE"
       }
       
        func login(withEmail email: String, withPassword password: String, completion: @escaping CompletionHandler = { _ in }) {
            let requestURL = LoginUserController.baseURL.appendingPathComponent("auth/login")
              
              var request = URLRequest(url: requestURL)
              request.httpMethod = HTTPMethod.post.rawValue
              request.setValue("application/json", forHTTPHeaderField: "Content-Type")
              
              do {
                  let userParams = ["email": email, "password": password] as [String: Any]
                  let json = try JSONSerialization.data(withJSONObject: userParams, options: .prettyPrinted)
                  request.httpBody = json
              } catch {
                  print("Error encoding user object: \(error)")
              }
              
              URLSession.shared.dataTask(with: request) { (data, response, error) in
                  if let response = response as? HTTPURLResponse,
                      response.statusCode != 200 {
                      completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                      return
                  }
                  
                  if let error = error { completion(error); return }
                
                  guard let data = data else { completion(NSError()); return }
                  
                  let decoder = JSONDecoder()
                  
                  do {
                    let token = try decoder.decode(Token.self, from: data)
                    UserDefaults.standard.set(token, forKey: "Token")
                    
                  } catch {
                      print("Error decoding bearer object: \(error)")
                      completion(error)
                      return
                  }
                  completion(nil)
              }.resume()
          }
}