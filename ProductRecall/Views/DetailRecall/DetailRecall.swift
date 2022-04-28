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
            DetailContainerTitle(
                title: "Motifs de rappel",
                color: .red)
            VStack {
                DetailContainer(
                    title: "Motif du rappel",
                    content: recall.reasonRecall)
                DetailContainer(
                    title: "Risques encourus",
                    content: recall.risksIncurred)
                DetailContainer(
                    title: "Précaunisations sanitaires",
                    content: recall.healthRecommendations)
                DetailContainer(
                    title: "Description du risque",
                    content: recall.additionalRiskDescription)
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

