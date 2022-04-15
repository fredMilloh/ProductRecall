//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import SwiftUI

struct HomeListView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        
        List(viewModel.recordList) { record in
                NavigationLink {
                    ProductDetail(
                        recordViewModel: RecordViewModel(recall: record)
                    )
                } label: {
                    let viewModel = RecordViewModel(recall: record)
                    RecordRow(recordViewModel: viewModel)
                }
                .onAppear(perform: {
                    viewModel.getFollowingRecords(recordItem: record)
                })
//                .alert(isPresented: $viewModel.endOfList) {
//                    Alert(title: Text(""),
//                          message: Text("Il n'y a pas d'autres résultats"),
//                          dismissButton: .default(Text("ok")))
//                }
        }
        .listStyle(.inset)
        .padding(.top, -10)
        .onAppear() {
            viewModel.requestProduct(endpoint: viewModel.getEndpoint())
        }
        .onChange(of: viewModel.selectedCategory.name) { newValue in
            viewModel.getNewList()
            viewModel.searchWithNewCategory = false
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(viewModel: HomeViewModel()).previewLayout(.sizeThatFits)
    }
}
