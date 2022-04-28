//
//  DetailMainView.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailMainView: View {
    
    @ObservedObject var recall: RecallViewModel
    
    var body: some View {
        ZStack {
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
            }
            .toolbar {
                ToolbarItem {
                    PersistenceButton(recall: recall, isSelected: $recall.isPersistent)
                }
            }
            .padding(.top, -15)
            FloatingShareButton(recall: recall)
        }
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMainView(recall: RecallViewModel.example)
            .previewLayout(.sizeThatFits)
    }
}

