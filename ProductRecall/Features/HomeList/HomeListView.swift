//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeListView: View {
    
    @ObservedObject var recordsFeed = HTTPClient()
    @StateObject var viewModel = SearchViewModel()
    
    var filteredRecords: [Record] {
        if viewModel.searchText.isEmpty {
            return recordsFeed.productsRecall
        } else {
            return recordsFeed.productsRecall.filter { record in
                guard let item = record.modelName else { return false }
                return item.localizedCaseInsensitiveContains(viewModel.searchText.localizedLowercase)
            }
        }
    }
    var body: some View {
        NavigationView {
            List(filteredRecords) { record in
                    NavigationLink {
                        ProductDetail(
                            recordViewModel: RecordViewModel(record: record)
                        )
                    } label: {
                        let viewModel = RecordViewModel(record: record)
                        RecordRow(recordViewModel: viewModel)
                    }
                    .onAppear(perform: {
                        if !self.recordsFeed.endOfList {
                            if self.recordsFeed.shouldLoadMore(recordItem: record) {
                                self.recordsFeed.get()
                            }
                        }
                    })
                    .alert(isPresented: $recordsFeed.endOfList) {
                        Alert(title: Text("Oups"),
                              message: Text("An error Occurred"),
                              dismissButton: .default(Text("ok")))
                    }
            }
            .navigationTitle("Rappels Produits")
            .refreshable {
                recordsFeed.get()
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Rechercher un produit, une marque, ...",
            suggestions: {
                
                if viewModel.isSearchEnabled {
                    Button {
                        recordsFeed.endPoint = ProductsEndpoint.whereSearchIs(string: viewModel.searchText)
                        recordsFeed.pageStatus = PageStatus.ready(nextOffset: 0)
                        recordsFeed.productsRecall.removeAll()
                        recordsFeed.get()
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
                        Button { [self] in
                            recordsFeed.endPoint = ProductsEndpoint.whereCategoryIs(search: category.name)
                            recordsFeed.pageStatus = PageStatus.ready(nextOffset: 0)
                            recordsFeed.productsRecall.removeAll()
                            recordsFeed.get()
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

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
