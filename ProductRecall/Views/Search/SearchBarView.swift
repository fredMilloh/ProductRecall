//
//  SearchBarView.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

struct SearchBarView: View {

    @Binding var searching: Bool
    @Binding var searchText: String
    @Environment(\.presentationMode) var presentationMode
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("searchGray"))
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField(
                        "Rechercher un produit, une marque, ...",
                        text: $searchText
                    ) { startedEditing in
                        if startedEditing {
                            withAnimation { searching = true }
                        }
                    } onCommit: { // dismiss view when user tap return key
                        withAnimation {
                            searching = false
                            UIApplication.shared.dismissKeyboard()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .focused($isTextFieldFocused)
                    .onAppear {
                        withAnimation {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.isTextFieldFocused = true
                            }
                            // activate keyboard when view appears
                        }
                    }
                    .submitLabel(.search) // Set the return keyboard key to search
                    if searching {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "xmark.circle")
                                .foregroundColor(.primary)
                        }
                        .padding()
                    }
                }
                .foregroundColor(.primary)
                .padding(.leading, 13)
            }
            .frame(height: 40)
            .cornerRadius(13)
            .shadow(color: .gray.opacity(0.5), radius: 5, x: 1, y: 1)

            Button {
                withAnimation {
                    searching = false
                    UIApplication.shared.dismissKeyboard()
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.pink)
                    .font(.title)
            }
        }
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searching: .constant(true), searchText: .constant("essai"))
    }
}
