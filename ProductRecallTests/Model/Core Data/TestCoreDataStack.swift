//
//  TestCoreDataStack.swift
//  ProductRecallTests
//
//  Created by fred on 22/04/2022.
//

import CoreData
@testable import ProductRecall

class TestCoreDataStack: CoreDataStack {

    override init() {
       super.init()

    let persistentStoreDescription = NSPersistentStoreDescription()
    persistentStoreDescription.type = NSInMemoryStoreType

    let testPersistentContainer = NSPersistentContainer(name: "RecallSelected")
        testPersistentContainer.persistentStoreDescriptions = [persistentStoreDescription]
        testPersistentContainer.loadPersistentStores { (_, error: Error?) in
            if let loadError = error {
                print(loadError)
            }
        }
      persistentContainer = testPersistentContainer
    }
}
