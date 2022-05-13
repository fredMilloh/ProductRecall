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

        let testPersistentContainer = NSPersistentContainer(name: "MockSelected")
        testPersistentContainer.persistentStoreDescriptions = [persistentStoreDescription]
        testPersistentContainer.loadPersistentStores { (_, error: Error?) in
            if let loadError = error {
                print(loadError)
            }
        }
        persistentContainer = testPersistentContainer
    }
}

@objc(MockSelected)
public class MockSelected: NSManagedObject {
}

extension MockSelected {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MockSelected> {
        return NSFetchRequest<MockSelected>(entityName: "MockSelected")
    }

    @NSManaged public var cardRef: String
    @NSManaged public var actionsToTake: String
}

extension MockSelected: Identifiable {
}
