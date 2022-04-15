//
//  DetailDescription.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailDescription: View {
    
    let recordViewModel: RecordViewModel
    
    var body: some View {
        VStack {
            Text("Description du produit")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.primary.opacity(0.5))
                
            
            DetailContainer(title: "Catégorie", content: recordViewModel.category)
            DetailContainer(title: "Sous Catégorie", content: recordViewModel.subCategory)
            DetailContainer(title: "Marque", content: recordViewModel.brandName)
            DetailContainer(title: "Modèle", content: recordViewModel.modelName)
            DetailContainer(title: "Identifiant Produit", content: recordViewModel.productID)
            DetailContainer(title: "Conditionnement", content: recordViewModel.packaging)
            DetailContainer(title: "Informations", content: recordViewModel.infos)
            DetailContainer(title: "Dates de commercialisation", content: recordViewModel.marketingDates)
            DetailContainer(title: "Température de conservation", content: recordViewModel.storageTemperature)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(35)
        .shadow(color: .gray, radius: 5, x: 1, y: 1)
    }
    
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDescription(
            recordViewModel: RecordViewModel(
                recall: RecordViewModel.example)
        ).previewLayout(.sizeThatFits)
    }
}
