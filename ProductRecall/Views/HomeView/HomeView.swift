//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {

    @StateObject var homeViewModel = HomeViewModel(client: HTTPClient())

    var body: some View {
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
