//
//  RecordRow.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct RecordRow: View {
    
    let recordViewModel: RecordViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: recordViewModel.imageUrl) { image in
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
                Text(recordViewModel.modelName)
                    .font(.caption)
                    .lineLimit(1)
                Text("**Risques** : \(recordViewModel.risksIncurred)")
                    .font(.caption2)
                Text("**Motif** : \(recordViewModel.reasonRecall)")
                    .font(.caption2)
                    .lineLimit(2)
                HStack {
                    Text("*\(recordViewModel.subCategory)*")
                        .font(.system(size: 6))
                    Text(recordViewModel.marketingDates)
                        .font(.system(size: 6))
                }
            }
        }
    }
}

struct RecordRow_Previews: PreviewProvider {
    static var previews: some View {
        RecordRow(recordViewModel: RecordViewModel(recall: RecordViewModel.example))
    }
}
