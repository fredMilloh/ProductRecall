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
        NavigationView {
            VStack {
                CategoriesView(viewModel: viewModel)
                HomeListView(viewModel: viewModel)
                .navigationTitle("Rappels Produits")
                .padding(.vertical, 0)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
