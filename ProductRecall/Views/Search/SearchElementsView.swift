//
//  SearchElementsView.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

struct SearchElementsView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Renseignez votre mot-clé puis sélectionnez une catégorie pour affiner votre recherche")
                .foregroundColor(.primary)
                .font(.title3)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .padding()
                
            Divider()
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Rechercher ") +
                Text("**\(viewModel.searchText)**  ")
                    .foregroundColor(.pink).italic() +
                Text(Image(systemName: "magnifyingglass.circle"))
                Text("dans la catégorie ") +
                Text("**\(viewModel.selectedCategory.description)** ?")
                    .foregroundColor(.pink).italic()
            }
            .foregroundColor(.primary)
            .font(.title3)
            .padding()
        }
        .padding()
    }
}

struct SearchElementsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchElementsView(viewModel: HomeViewModel()).previewLayout(.sizeThatFits)
    }
}
