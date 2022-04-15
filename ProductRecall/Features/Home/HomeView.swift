//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                CategoriesView(selectCategory: $homeViewModel.selectedCategory)
                
                HomeListView(homeViewModel: homeViewModel)
                
                Divider()
                
                HomeSearchButton(homeViewModel: homeViewModel)
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
