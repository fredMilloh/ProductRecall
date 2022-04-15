//
//  PersistenceButton.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct PersistenceButton: View {
    
    @ObservedObject var recallViewModel: RecallViewModel
    
    var body: some View {
        Button {
            recallViewModel.togglePersistence()
        } label: {
            recallViewModel.isSelected ?
            Image(systemName: "tray.and.arrow.down.fill") :
            Image(systemName: "tray.and.arrow.down")
        }
        .foregroundColor(.pink)
    }
}
