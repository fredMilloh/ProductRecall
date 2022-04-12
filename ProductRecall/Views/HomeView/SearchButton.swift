//
//  SearchButton.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

struct SearchButton: View {
    
    @ObservedObject var viewModel: HomeViewModel
    @State var showView = false
    
    var body: some View {

        Button {
            showView.toggle()
            viewModel.searchText = ""
        } label: {
            if viewModel.searchWithText {
                HStack {
                    Image(systemName: "magnifyingglass.circle")
                    Text(viewModel.searchText)
                    Button {
                        viewModel.searchText = ""
                    } label: {
                        Image(systemName: "delete.left.fill")
                    }
                }
                .padding()
            } else {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.primary)
                    Text("Rechercher un produit, par mot-clé, ...")
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
            SearchView(viewModel: viewModel)
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton(viewModel: HomeViewModel())
    }
}
