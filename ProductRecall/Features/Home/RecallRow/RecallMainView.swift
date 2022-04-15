//
//  RecallMainView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct RecallMainView: View {
    
    @ObservedObject var recallViewModel: RecallViewModel
//    let recall: RecordViewModel
    
    var body: some View {
        HStack {
            RecordRowBaseView(recall: recallViewModel)
            Spacer()
            ZStack(alignment: .trailing) {
                PersistenceButton(recallViewModel: recallViewModel)
            }
            .frame(width: 30, height: 30, alignment: .top)
            .onTapGesture {
                recallViewModel.togglePersistence()
            }
        }
    }
}
