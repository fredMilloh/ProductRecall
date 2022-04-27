//
//  SearchMainView.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

struct SearchMainView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State var searching = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text(searching ? "Recherche" : "Rappels Produits")
                    .foregroundColor(.primary)
                    .font(.title)
                Spacer()
                Button {
                    withAnimation {
                        searching = false
                        UIApplication.shared.dismissKeyboard()
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Annuler")
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
            .padding()
            Rectangle().frame(height: 1)
                .foregroundColor(searching ? .blue : .gray.opacity(0.4))
            
            SearchElementsView(homeViewModel: homeViewModel)
            
            CategoriesView(selectCategory: $homeViewModel.selectedCategory)
            
            SearchBarView(searching: $searching, searchText: $homeViewModel.searchText)
    
        }
        .onAppear() {
            homeViewModel.searchWithNewCategory = true
        }
        .onSubmit {
            homeViewModel.searchWithNewCategory ?
            homeViewModel.getNewList() :
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct TextSearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMainView(homeViewModel: HomeViewModel(client: HTTPClient())).previewLayout(.sizeThatFits)
    }
}
