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
            VStack {
                if viewModel.isSearchEnabled {
                    Button {
                        recordsFeed.endPoint = ProductsEndpoint.whereSearchIs(string: viewModel.searchText)
                        recordsFeed.pageStatus = PageStatus.ready(nextOffset: 0)
                        recordsFeed.productsRecall.removeAll()
                        recordsFeed.get()
                    } label: {
                        Text("Lancer une recherche dans l'historique")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.blue)
                }
                List {
                    ForEach(filteredRecords) { record in
                        NavigationLink {
                            ProductDetail(recordViewModel: RecordViewModel(record: record))
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
                            Alert(title: Text("Oups"), message: Text("An error Occurred"), dismissButton: .default(Text("ok")))
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Rappels Produits")
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Rechercher un produit, une marque, ..."
        )
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
