//
//  PersistenceButton.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct PersistenceButton: View {
    
    @ObservedObject var recordViewModel: RecordViewModel
    
    var body: some View {
        Button {
            recordViewModel.togglePersistence()
        } label: {
            recordViewModel.isSelected ?
            Image(systemName: "tray.and.arrow.down.fill") :
            Image(systemName: "tray.and.arrow.down")
        }
    }
}

struct PersistenceButton_Previews: PreviewProvider {
    static var previews: some View {
        PersistenceButton(recordViewModel: RecordViewModel(recall: RecordViewModel.example))
    }
}
