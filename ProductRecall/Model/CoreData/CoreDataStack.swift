//
//  CoreDataStack.swift
//  ProductRecall
//
//  Created by fred on 05/05/2022.
//

import Foundation
import CoreData

class CoreDataStack {

    /// Instantiates NSPersistentContainer with the model name
    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RecallSelected")
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
        return container
    }()

    /// Get the viewContext property of the NSPersistentContainer instance
    public lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
