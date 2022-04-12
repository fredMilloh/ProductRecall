//
//  SearchView.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: HomeViewModel
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
            
            SearchElementsView(viewModel: viewModel)
            
            CategoriesView(selectCategory: $viewModel.selectedCategory)
            
            SearchBarView(searching: $searching, searchText: $viewModel.searchText)
    
        }
        .onAppear() {
            viewModel.searchWithNewCategory = true
        }
        .onSubmit {
            viewModel.searchWithNewCategory ?
            viewModel.getNewList() :
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct TextSearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: HomeViewModel()).previewLayout(.sizeThatFits)
    }
}
