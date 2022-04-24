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
            Text("Conditions Particulières")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80, alignment: .center)
                .foregroundColor(Color.primary.opacity(0.5))
                .background(.orange)
            VStack {
                DetailContainer(title: "Conduite à tenir", content: recall.actionsToTake)
                DetailContainer(title: "Modalités de compensation", content: recall.compensationTerms)
                DetailContainer(title: "Date de fin du rappel", content: recall.endDateRecall)
                DetailContainer(title: "Informations complèmentaires", content: recall.otherInfos)
                DetailContainer(title: "Nature juridique du rappel", content: recall.legalCharacter)
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

