//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                CategoriesView(selectCategory: $viewModel.selectedCategory)
                
                HomeListView(viewModel: viewModel)
                
                Divider()
                
                SearchButton(viewModel: viewModel)
            }
            .navigationTitle("Rappels Produits")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
