//
//  RecallMainView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct RecallMainRow: View {

    @ObservedObject var recall: RecallViewModel
    @State var items: [Any] = []
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
                    PersistenceManager.shared.fetchSelected { _ in}
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
