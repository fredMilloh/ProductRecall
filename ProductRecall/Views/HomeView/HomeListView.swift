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

        List {
            ForEach(homeViewModel.recallList) { recall in
                NavigationLink {
                    DetailMainView(recall: recall)
                } label: {
                    RecallMainRow(recall: recall)
                }
                .isDetailLink(false)
                .onAppear(perform: {
                    // Launch new request for following records
                    homeViewModel.getFollowingRecords(recordItem: recall)
                    recall.isSelected()
                })
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
            homeViewModel.requestProduct(fromService: homeViewModel.client, endpoint: homeViewModel.getEndpoint())
        }
        .onChange(of: homeViewModel.selectedCategory.name) { _ in
            // launch new request with other category
            homeViewModel.getNewList()
            homeViewModel.searchWithNewCategory = false
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(homeViewModel: HomeViewModel(client: HTTPClient()))
            .previewLayout(.sizeThatFits)
    }
}
