//
//  PersistenceButton.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct PersistenceButton: View {
    
    @ObservedObject var recall: RecallViewModel
    
    var body: some View {
        Button {
            recall.togglePersistence()
        } label: {
            recall.isSelected ?
            Image(systemName: "tray.and.arrow.down.fill") :
            Image(systemName: "tray.and.arrow.down")
        }
        .foregroundColor(.pink)
    }
}
