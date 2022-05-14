//
//  RecallMainView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct RecallMainRow: View {

    /// Subscription to the observable RecallViewModel
    @ObservedObject var recall: RecallViewModel
    /// Source of truth to share recall
    @State var items: [Any] = []
    /// Source of truth to show or not the share view
    @State var showView = false

    var body: some View {
        HStack {
            RecallBaseRow(recall: recall)
            Spacer()
            VStack(alignment: .trailing, spacing: 20) {
                ZStack {
                    PersistenceButton(recall: recall, isSelected: $recall.isPersistent)
                }
                .onTapGesture {
                    recall.togglePersistence()
                    PersistenceManager.shared.fetchSelected()
                    // update selected recall state after toggle
                }
                ZStack {
                    Image(systemName: "square.and.arrow.up")
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                    .onTapGesture {
                        items.removeAll()
                        guard let url = recall.flyerImageLink else { return }
                        items.append(url)
                        showView.toggle()
                    }
                    .sheet(isPresented: $showView) {
                        ShareSheet(activityItems: $items)
                    }
                }
            }
        }
    }
}
