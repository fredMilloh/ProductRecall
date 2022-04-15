//
//  DetailCondition.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailCondition: View {
    
    let recordViewModel: RecordViewModel
    
    var body: some View {
        VStack {
            Text("Conditions Particulières")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.primary.opacity(0.5))
            
            DetailContainer(title: "Conduite à tenir", content: recordViewModel.actionToTake)
            DetailContainer(title: "Modalités de compensation", content: recordViewModel.compensationTerms)
            DetailContainer(title: "Date de fin du rappel", content: recordViewModel.endDateRecall)
            DetailContainer(title: "Informations complèmentaires", content: recordViewModel.otherInfos)
            DetailContainer(title: "Nature juridique du rappel", content: recordViewModel.legalCharacter)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(35)
        .shadow(color: .gray, radius: 5, x: 1, y: 1)
    }
}

struct DetailCondition_Previews: PreviewProvider {
    static var previews: some View {
        DetailCondition(
            recordViewModel: RecordViewModel(recall: RecordViewModel.example)
        ).previewLayout(.sizeThatFits)
    }
}

