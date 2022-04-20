//
//  RecallMainView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct RecallMainRow: View {
    
    @ObservedObject var recall: RecallViewModel
    
    var body: some View {
        HStack {
            RecallBaseRow(recall: recall)
            Spacer()
            ZStack(alignment: .trailing) {
                PersistenceButton(recall: recall, isSelected: $recall.isPersistent)
            }
            .frame(width: 30, height: 30, alignment: .top)
            .onTapGesture {
                recall.togglePersistence()
            }
        }
    }
}
