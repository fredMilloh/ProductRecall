//
//  PersistenceButton.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct PersistenceButton: View {

    @ObservedObject var recall: RecallViewModel
    @Binding var isSelected: Bool

    var body: some View {
        Button {
            recall.togglePersistence()
        } label: {
            isSelected
            ? Image(systemName: "flag.fill")
            : Image(systemName: "flag")
        }
        .foregroundColor(.pink)
    }
}
