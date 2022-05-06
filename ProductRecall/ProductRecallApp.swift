//
//  ProductRecallApp.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

@main
struct ProductRecallApp: App {

    let persistenceManager = PersistenceManager.shared
	let coreDataStack = CoreDataStack()

    var body: some Scene {
        WindowGroup {
            AppNavigationView()
                .environment(\.managedObjectContext, coreDataStack.viewContext)
        }
    }
}
