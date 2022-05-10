//
//  HomeSearchButton.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

struct HomeSearchButton: View {

    @ObservedObject var homeViewModel: HomeViewModel
    @State var showView = false

    var body: some View {

        Button {
            showView.toggle()
            homeViewModel.searchText = ""
        } label: {
            if homeViewModel.searchWithText {
                HStack {
                    Image(systemName: "magnifyingglass.circle")
                    Text(homeViewModel.searchText)
                    Button {
                        homeViewModel.searchText = ""
                        homeViewModel.getNewList()
                    } label: {
                        Image(systemName: "delete.left.fill")
                    }
                }
                .padding()
            } else {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                    Text("Rechercher un produit, une marque, ...")
                }
                .padding(.leading, 13)
            }
        }
        .buttonStyle(.borderless)
        .frame(height: 40)
        .background(Color("searchGray"))
        .cornerRadius(13)
        .shadow(color: .gray.opacity(0.5), radius: 5, x: 1, y: 1)
        .fullScreenCover(isPresented: $showView) {
            SearchMainView(homeViewModel: homeViewModel)
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchButton(homeViewModel: HomeViewModel(client: HTTPClient()))
    }
}
