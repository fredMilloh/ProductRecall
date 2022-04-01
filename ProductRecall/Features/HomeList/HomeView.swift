//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeListViewModel()
    
    var body: some View {
        NavigationView {
            HomeListView()
            .navigationTitle("Rappels Produits")
            .refreshable {
                viewModel.requestProduct()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
