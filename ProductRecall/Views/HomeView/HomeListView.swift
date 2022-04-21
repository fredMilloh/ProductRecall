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
        
        List(homeViewModel.recallList) { recall in
                NavigationLink {
                    DetailMainView(recall: recall)
                } label: {
                    RecallMainRow(recall: recall)
                }
                .onAppear(perform: {
                    homeViewModel.getFollowingRecords(recordItem: recall)
                })
                .onAppear {
                    recall.isSelected()
                }
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
        HomeListView(homeViewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
    }
}
