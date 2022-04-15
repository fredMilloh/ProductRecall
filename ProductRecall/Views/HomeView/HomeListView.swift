//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import SwiftUI

struct HomeListView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        
        List(homeViewModel.recordList) { record in
                NavigationLink {
                    DetailMainView(
                        recall: RecallViewModel(recall: record)
                    )
                } label: {
                    let recall = RecallViewModel(recall: record)
                    RecallMainView(recallViewModel: recall)
                }
                .onAppear(perform: {
                    homeViewModel.getFollowingRecords(recordItem: record)
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
            homeViewModel.requestProduct(endpoint: homeViewModel.getEndpoint())
        }
        .onChange(of: homeViewModel.selectedCategory.name) { newValue in
            homeViewModel.getNewList()
            homeViewModel.searchWithNewCategory = false
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(homeViewModel: HomeViewModel()).previewLayout(.sizeThatFits)
    }
}
