//
//  RecordRowBaseView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct RecordRowBaseView: View {
    
    let recall: RecallViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: recall.imageUrl) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
                    .foregroundColor(.primary)
            }
            .frame(width: 90, height: 90)
            .background(Color("lightGray"))
            .cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0.5, y: 0.5)
                                
            VStack(alignment: .leading, spacing: 5) {
                Text(recall.modelName)
                    .font(.caption)
                    .lineLimit(1)
                Text("**Risques** : \(recall.risksIncurred)")
                    .font(.caption2)
                Text("**Motif** : \(recall.reasonRecall)")
                    .font(.caption2)
                    .lineLimit(2)
                HStack {
                    Text("*\(recall.subCategory)*")
                        .font(.system(size: 6))
                    Text(recall.marketingDates)
                        .font(.system(size: 6))
                }
            }
        }
    }
}

struct RecordRowBaseView_Previews: PreviewProvider {
    static var previews: some View {
        RecordRowBaseView(recall: RecallViewModel.example)
    }
}
