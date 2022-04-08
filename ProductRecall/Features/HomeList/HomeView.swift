//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                CategoriesView(selectCategory: $viewModel.selectedCategory)
                HomeListView(viewModel: viewModel)
                .navigationTitle("Rappels Produits")
                .padding(.vertical, 0)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .automatic),
            prompt: "Rechercher un produit, une marque, ...",
            suggestions: {
                SearchView(viewModel: viewModel)
        })
        /// the search button on the keyboard makes the view disappear
        .onSubmit {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
