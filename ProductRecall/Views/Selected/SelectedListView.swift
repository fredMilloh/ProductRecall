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

        List {
            ForEach(persistence.recallSelected) { recall in
                NavigationLink {
                    DetailMainView(recall: recall)
                } label: {
                    RecallMainRow(recall: recall)
                }
                .onChange(of: recall.isPersistent, perform: { _ in
                    withAnimation {
                        persistence.fetchSelected()
                    }
                })
            }
            if persistence.recallSelected.isEmpty {
                HStack {
                    Spacer()
                    EmptySelectedMessage()
                    Spacer()
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle("Rappels Retenus")
        .onAppear {
            persistence.fetchSelected()
        }
    }
}

struct SelectedListView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedListView(persistence: PersistenceManager.shared)
    }
}
