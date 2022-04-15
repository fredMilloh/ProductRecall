//
//  ProductRecallApp.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

@main
struct ProductRecallApp: App {
    
    let persistenceRepository = PersistenceRepository.shared
    
    var body: some Scene {
        WindowGroup {
            AppNavigationView()
                .environment(\.managedObjectContext, persistenceRepository.container.viewContext)
        }
    }
}
