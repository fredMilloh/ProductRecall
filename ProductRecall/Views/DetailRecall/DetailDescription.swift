//
//  DetailDescription.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailDescription: View {
    
    let recall: RecallViewModel
    
    var body: some View {
        VStack {
            Divider()
            Text("Description du produit")
                .font(.title)
            VStack(spacing: 15) {
                DetailContainer(
                    title: "Catégorie",
                    content: recall.category)
                DetailContainer(
                    title: "Sous Catégorie",
                    content: recall.subCategory)
                DetailContainer(
                    title: "Marque",
                    content: recall.brandName)
                DetailContainer(
                    title: "Modèle",
                    content: recall.modelName)
                DetailContainer(
                    title: "Identifiant Produit",
                    content: recall.productId)
                DetailContainer(
                    title: "Conditionnement",
                    content: recall.packaging)
                DetailContainer(
                    title: "Informations",
                    content: recall.infos)
                DetailContainer(
                    title: "Dates de commercialisation",
                    content: recall.marketingDates)
                DetailContainer(
                    title: "Température de conservation",
                    content: recall.storageTemperature)
            }
            .padding()
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDescription(recall: RecallViewModel.example)
        .previewLayout(.sizeThatFits)
    }
}
