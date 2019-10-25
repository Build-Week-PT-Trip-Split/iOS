//
//  CoreDataStack.swift
//  Split Trip
//
//  Created by Seschwan on 10/24/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "User")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return self.container.viewContext
    }
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
        var error: Error?
        context.performAndWait {
            do {
                try context.save()
            } catch let saveError {
                error = saveError
            }
        }
        if let error = error { throw error }
    }
    
    func deleteFromPersistentStore() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        do {
            if let user = try moc.fetch(fetchRequest).first {
            moc.delete(user)
            print("User was deleted: \(user)")
            }
        } catch {
            NSLog("There was an error getting the User from CoreData")
        }
    }
}
