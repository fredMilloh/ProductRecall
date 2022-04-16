//
//  DetailMainView.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailMainView: View {
    
    let recall: RecallViewModel
    
    var body: some View {
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
                    .padding()
                DetailDistribution(recall: recall)
                    .padding()
                
                DetailRecall(recall: recall)
                    .padding()
                
                DetailCondition(recall: recall)
                    .padding()
            }
        }
        .toolbar {
            ToolbarItem {
                PersistenceButton(recall: recall)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMainView(recall: RecallViewModel.example)
            .previewLayout(.sizeThatFits)
    }
}

