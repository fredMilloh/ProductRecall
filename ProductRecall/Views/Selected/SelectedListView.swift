//
//  SelectedListView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct SelectedListView: View {
    
    @ObservedObject var persistenceRepository: PersistenceRepository
    
//    @FetchRequest(sortDescriptors: [], animation: .default)
//    private var selectedRecords: FetchedResults<RecallSelected>
    
    var body: some View {
        List {
            if persistenceRepository.selectedArray.isEmpty {
                EmptySelectedMessage()
            }
            ForEach(persistenceRepository.selectedArray) { select in
                NavigationLink {

                } label: {
                    VStack {
                        Text(select.modelName ?? "NO MODEL")
                    }
                }
            }
        }
        .onChange(of: persistenceRepository.selectedArray) { newValue in
            persistenceRepository.fetchSelected()
        }
        .listStyle(.inset)
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView(persistenceRepository: PersistenceRepository.shared)
    }
}
