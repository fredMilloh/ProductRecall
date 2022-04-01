//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeListViewModel()
    
//    var filteredRecords: [Record] {
//        if viewModel.searchText.isEmpty {
//            return recordsFeed.productsRecall
//        } else {
//            return recordsFeed.productsRecall.filter { record in
//                guard let item = record.modelName else { return false }
//                return item.localizedCaseInsensitiveContains(viewModel.searchText.localizedLowercase)
//            }
//        }
//    }
    var body: some View {
        NavigationView {
            HomeListView()
            .navigationTitle("Rappels Produits")
            .refreshable {
                viewModel.requestProduct()
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Rechercher un produit, une marque, ...",
            suggestions: {
                
                if viewModel.isSearchEnabled {
                    Button {
//                        recordsFeed.endPoint = ProductsEndpoint.whereSearchIs(string: viewModel.searchText)
//                        recordsFeed.pageStatus = PageStatus.ready(nextOffset: 0)
//                        recordsFeed.productsRecall.removeAll()
//                        recordsFeed.get()
                    } label: {
                        HStack {
                            Text("Lancer une recherche avec **\(viewModel.searchText)**")
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    .foregroundColor(.blue)
                }
                
                Section(header: Text("Catégories").bold()) {
                    ForEach(Category.categories, id: \.id) { category in
                        Button {
//                            recordsFeed.endPoint = ProductsEndpoint.whereCategoryIs(search: category.name)
//                            recordsFeed.pageStatus = PageStatus.ready(nextOffset: 0)
//                            recordsFeed.productsRecall.removeAll()
//                            recordsFeed.get()
                        } label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text(category.name)
                            }
                        }
                    }
                }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
