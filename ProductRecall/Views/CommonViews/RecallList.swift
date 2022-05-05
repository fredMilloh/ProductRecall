//
//  RecallList.swift
//  ProductRecall
//
//  Created by fred on 18/04/2022.
//

import SwiftUI

struct RecallList <Content, Data>:
    View where Content: View,
                Data: RandomAccessCollection,
                Data.Element: RecallViewModel {

    let recalls: Data
    let messageView: Content

    init(_ recalls: Data, @ViewBuilder messageView: () -> Content) {
      self.recalls = recalls
      self.messageView = messageView()
    }

    var body: some View {
        List {
            ForEach(recalls) { recall in
                NavigationLink {
                    DetailMainView(recall: recall)
                } label: {
                    RecallMainRow(recall: recall)
                }
                .isDetailLink(false)
            }
            messageView
        }
        .listStyle(.inset)
    }
}

struct RecallList_Previews: PreviewProvider {
    static var recall = [RecallViewModel.example]
    static var previews: some View {
        NavigationView {
            RecallList(recall) {
                Text("essai preview RecallList")
            }
        }
    }
}

extension RecallList where Content == EmptyView {

  init(_ recalls: Data) {
    self.init(recalls) {
      EmptyView()
    }
  }
}
