//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import SwiftUI

struct HomeListView: View {
    @ObservedObject var recordsFeed = HTTPClient()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(recordsFeed.productsRecall) { record in
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
                        .navigationTitle("Rappels Produits")
                    }
                }
            }
            
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
