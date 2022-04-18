//
//  SelectedListView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct SelectedListView: View {
    
    var body: some View {
        
        RecallList(PersistenceRepository.shared.recallSelected)
//        List {
//            if PersistenceRepository.shared.selectedArray.isEmpty {
//                EmptySelectedMessage()
//            }
//            ForEach(PersistenceRepository.shared.selectedArray) { select in
//                NavigationLink {
//
//                } label: {
//                    VStack {
//                        Text(select.modelName ?? "NO Modelname")
//                    }
//                }
//            }
//        }
//        .onChange(of: PersistenceRepository.shared.selectedArray) { newValue in
//            PersistenceRepository.shared.fetchSelected()
//        }
//        .listStyle(.inset)
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView()
    }
}
