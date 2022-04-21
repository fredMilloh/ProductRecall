//
//  SelectedListView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct SelectedListView: View {
    
    @ObservedObject var persistence: PersistenceManager
    
    var body: some View {
        
        List(persistence.recallSelected) { recall in
            NavigationLink {
                DetailMainView(recall: recall)
            } label: {
                RecallMainRow(recall: recall)
            }
            .navigationTitle("Rappels Retenus")
        }
        .listStyle(.inset)
        .onAppear() {
            PersistenceManager.shared.fetchSelected()
        }
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView(persistence: PersistenceManager.shared)
    }
}
