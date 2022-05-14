//
//  DetailMainView.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailMainView: View {

    @ObservedObject var recall: RecallViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            VStack {
                ImageAsync(
                    url: recall.imageUrl ?? URL(fileURLWithPath: "")
                )
                .aspectRatio(contentMode: .fill)
                .padding()
                LinkView(
                    url: recall.flyerImageLink ?? URL(fileURLWithPath: "")
                )
                DetailDescription(recall: recall)
                DetailDistribution(recall: recall)
                DetailRecall(recall: recall)
                DetailCondition(recall: recall)
            }
            .navigationTitle("Détails du rappel")
        }
        .toolbar {
            ToolbarItem {
                PersistenceButton(recall: recall, isSelected: $recall.isPersistent)
            }
        }
        .onChange(of: recall.isPersistent, perform: { _ in
            withAnimation {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMainView(recall: RecallViewModel.example)
            .previewLayout(.sizeThatFits)
    }
}
