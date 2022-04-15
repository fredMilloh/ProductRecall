//
//  SelectedRecord.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct SelectedRecord: View {
    
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(
            keyPath: \RecordSelected.brandName,
            ascending: true
        )
      ],
      animation: .default
    )
    private var selectedRecords: FetchedResults<RecordSelected>
    
    var body: some View {
        List {
            ForEach(selectedRecords) { record in
                // condition si aucun retenus
                VStack {
                    Text(record.category ?? "")
                    Text(record.brandName ?? "")
                    Text(record.modelName ?? "")
                }
            }
        }
    }
}

struct SelectedRecord_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRecord()
    }
}
