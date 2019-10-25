//
//  User+Convenience.swift
//  Split Trip
//
//  Created by Seschwan on 10/24/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
    var userRepresentation: UserRepresentation? {
        guard let name = self.name,
            let username = self.username,
            let password = self.password,
            let email = self.email else { return nil }
        return UserRepresentation(name: name, username: username, password: password, email: email)
    }
    
    convenience init(name: String, username: String, password: String, email: String, context: NSManagedObjectContext = CoreDataStack.shared.mainContext)
    {
        self.init(context: context)
        self.name = name
        self.username = username
        self.password = password
        self.email = email
    }
}
