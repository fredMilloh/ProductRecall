//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {

    /// Source of truth HomeViewModel
    @StateObject var homeViewModel = HomeViewModel()

    var body: some View {
		/// Use ScrollViewReader for better management of constraints than NavigationView
        ScrollViewReader { _ in
            VStack {
                CategoriesView(
                    selectCategory: $homeViewModel.selectedCategory)

                HomeListView(homeViewModel: homeViewModel)
                    .padding(.bottom, -7)
                Divider()
                HomeSearchButton(homeViewModel: homeViewModel)

                Divider()
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
