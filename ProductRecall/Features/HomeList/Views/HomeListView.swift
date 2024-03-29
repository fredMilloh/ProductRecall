//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import SwiftUI

struct HomeListView: View {

    /// Subscription to the observable HomeViewModel
    @ObservedObject var homeViewModel: HomeViewModel

    var body: some View {

        List {
            ForEach(homeViewModel.recallList) { recall in
                NavigationLink {
                    DetailMainView(recall: recall)
                } label: {
                    RecallMainRow(recall: recall)
                }
                .isDetailLink(false)
                .onAppear(perform: {
                    homeViewModel.getFollowingRecords(recordItem: recall)
                    /// Launch new request for following records
                })
                .onAppear {
                    recall.isSelected()
                }
            }
            if homeViewModel.recallList.isEmpty {
                HStack {
                    Spacer()
                    EmptyListMessage()
                    Spacer()
                }
            }
        }
        .listStyle(.inset)
        .onAppear {
            homeViewModel.requestProduct(endpoint: homeViewModel.getEndpoint())
        }
        .onChange(of: homeViewModel.selectedCategory.name) { _ in
            homeViewModel.getNewList()
            homeViewModel.searchWithNewCategory = false
            /// launch new request with other category
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(homeViewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
    }
}
