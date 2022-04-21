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
                    AsyncImage(url: recall.imageUrl) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "camera.fill")
                    }
                    .background(Color("lightGray"))
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(25)
                    .shadow(color: .gray, radius: 5, x: 1, y: 1)
                    .padding()
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

