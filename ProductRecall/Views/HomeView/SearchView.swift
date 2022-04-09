//
//  SearchView.swift
//  ProductRecall
//
//  Created by fred on 08/04/2022.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {

            Text("Lancer une recherche avec :")
            Text("**\(viewModel.searchText)**")
                .foregroundColor(.pink)
                .frame(height: 30, alignment: .center)
            Divider()

            Text("Dans la catégorie :")
            Text("\(viewModel.selectedCategory.description) ?")
                .foregroundColor(.pink)
                .frame(height: 30, alignment: .center)
            
            CategoriesView(selectCategory: $viewModel.selectedCategory)
                .padding()
            
            Spacer()
        }
        .padding()
        .foregroundColor(.blue)
        .onAppear() {
            viewModel.searchWithNewCategory = true
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
    }
}
