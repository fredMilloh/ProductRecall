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
        
        RecallList(persistence.recallSelected) {
            if persistence.recallSelected.isEmpty {
                HStack {
                    Spacer()
                    EmptySelectedMessage()
                    Spacer()
                }
            }
        }
        .navigationTitle("Rappels Retenus")
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
