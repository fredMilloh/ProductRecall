//
//  DetailCondition.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailCondition: View {
    
    let recall: RecallViewModel
    
    var body: some View {
        VStack {
            Divider()
            Text("Conditions Particulières")
                .font(.title)
            VStack {
                DetailContainer(
                    title: "Conduite à tenir",
                    content: recall.actionsToTake)
                DetailContainer(
                    title: "Modalités de compensation",
                    content: recall.compensationTerms)
                DetailContainer(
                    title: "Date de fin du rappel",
                    content: recall.endDateRecall)
                DetailContainer(
                    title: "Informations complèmentaires",
                    content: recall.otherInfos)
                DetailContainer(
                    title: "Nature juridique du rappel",
                    content: recall.legalCharacter)
            }
            .padding()
        }
    }
}

struct DetailCondition_Previews: PreviewProvider {
    static var previews: some View {
        DetailCondition(recall: RecallViewModel.example).previewLayout(.sizeThatFits)
    }
}

