//
//  DetailRecall.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailRecall: View {
    
    let recall: RecallViewModel
    
    var body: some View {
        VStack {
            Text("Motifs de rappel")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80, alignment: .center)
                .foregroundColor(Color.primary.opacity(0.5))
                .background(.pink)
            VStack {
                DetailContainer(title: "Motif du rappel", content: recall.reasonRecall)
                DetailContainer(title: "Risques encourus", content: recall.risksIncurred)
                DetailContainer(title: "Précaunisations sanitaires", content: recall.healthRecommendations)
                DetailContainer(title: "Description du risque", content: recall.additionalRiskDescription)
            }
            .padding()
        }
    }
}

struct DetailRecall_Previews: PreviewProvider {
    static var previews: some View {
        DetailRecall(recall: RecallViewModel.example).previewLayout(.sizeThatFits)
        
    }
}

