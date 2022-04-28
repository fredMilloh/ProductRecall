//
//  RecordRowBaseView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct RecallBaseRow: View {
    
    let recall: RecallViewModel
    
    var body: some View {
        HStack {
            ImageAsync(
                url: recall.imageUrl ?? URL(fileURLWithPath: "")
            )
            .frame(width: 90, height: 90)
                                
            VStack(alignment: .leading, spacing: 5) {
                Text(recall.modelName)
                    .font(.caption)
                    .lineLimit(1)
                Text("**Risques** : \(recall.risksIncurred)")
                    .font(.caption2)
                    .lineLimit(3)
                Text("**Motif** : \(recall.reasonRecall)")
                    .font(.caption2)
                    .lineLimit(2)
                HStack {
                    Text("*\(recall.subCategory)*")
                        .font(.system(size: 6))
                    Spacer()
                    Text(recall.marketingDates)
                        .font(.system(size: 6))
                }
            }
        }
    }
}

struct RecordRowBaseView_Previews: PreviewProvider {
    static var previews: some View {
        RecallBaseRow(recall: RecallViewModel.example)
    }
}
