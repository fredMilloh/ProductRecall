//
//  CoreDataStack.swift
//  ProductRecall
//
//  Created by fred on 05/05/2022.
//

import Foundation
import CoreData

class CoreDataStack {

    static let modelName = "RecallSelected"

    public lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataStack.modelName)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
        return container
    }()

    public lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
}
