//
//  DetailRecall.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailRecall: View {
    
    let recordViewModel: RecordViewModel
    
    var body: some View {
        VStack {
            Text("Motifs de rappel")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.primary.opacity(0.5))
            
            DetailContainer(title: "Motif du rappel", content: recordViewModel.reasonRecall)
            DetailContainer(title: "Risques encourus", content: recordViewModel.risksIncurred)
            DetailContainer(title: "Précaunisations sanitaires", content: recordViewModel.healthRecommendations)
            DetailContainer(title: "Description du risque", content: recordViewModel.additionalRiskDescription)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(35)
        .shadow(color: .gray, radius: 5, x: 1, y: 1)
    }
}

struct DetailRecall_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecall(recordViewModel: RecordViewModel(record: RecordViewModel.example))
    }
}

