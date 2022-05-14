//
//  PersistenceButton.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct PersistenceButton: View {

    /// Button to select or deselect a recall

	/// Subscription to the observable recall object
    @ObservedObject var recall: RecallViewModel
    /// Captures the information needed to update the view
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
