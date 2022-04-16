//
//  SelectedListView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct SelectedListView: View {
    
    @StateObject var persistenceRepository = PersistenceRepository.shared
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(
            keyPath: \RecallSelected.brandName,
            ascending: true
        )
      ],
      animation: .default
    )
    private var selectedRecords: FetchedResults<RecallSelected>
    
    var body: some View {
        List {
            ForEach(selectedRecords) { selected in
//                let persistent = persistenceRepository.convertIntoRecord(selected: selected)
        
                // condition si aucun retenus
                VStack {
                    Text(selected.category ?? "")
                    Text(selected.brandName ?? "")
                    Text(selected.modelName ?? "")
                }
            }
        }
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView()
    }
}
