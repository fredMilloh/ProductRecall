//
//  RecallMainView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct RecallMainRow: View {
    
    var recall: RecallViewModel
    
    var body: some View {
        HStack {
            RecordRowBaseView(recall: recall)
            Spacer()
            ZStack(alignment: .trailing) {
                PersistenceButton(recall: recall)
            }
            .frame(width: 30, height: 30, alignment: .top)
            .onTapGesture {
                recall.togglePersistence()
            }
        }
    }
}
