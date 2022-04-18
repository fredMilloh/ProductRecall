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
            Image(systemName: "flag.fill") :
            Image(systemName: "flag")
        }
        .foregroundColor(.pink)
    }
}
