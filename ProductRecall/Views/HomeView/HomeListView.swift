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
                .isDetailLink(false)
                .onAppear(perform: {
                    homeViewModel.getFollowingRecords(recordItem: recall)
                })
                .onAppear {
                    recall.isSelected()
                }
        }
        .listStyle(.inset)
        .onAppear {
            homeViewModel.requestProduct(fromService: homeViewModel.client, endpoint: homeViewModel.getEndpoint())
        }
        .onChange(of: homeViewModel.selectedCategory.name) { _ in
            homeViewModel.getNewList()
            homeViewModel.searchWithNewCategory = false
        }
        .safeAreaInset(edge: .bottom) {
            Rectangle()
                .fill(LinearGradient(colors: [.white, .white.opacity(0)],
                                     startPoint: .bottom,
                                     endPoint: .top))
                .frame(height: 90)
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(homeViewModel: HomeViewModel())
            .previewLayout(.sizeThatFits)
    }
}
