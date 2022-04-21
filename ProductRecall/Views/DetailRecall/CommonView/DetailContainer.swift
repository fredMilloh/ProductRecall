//
//  DetailContainer.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailContainer: View {
    
    var title: String
    var content: String
    
    var body: some View {
        if !content.isEmpty {
            VStack {
                Text(title)
                    .font(.headline)
                    .frame(maxWidth : .infinity, alignment:
                            .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: -10, trailing: 0))
                    .foregroundColor(Color.primary.opacity(0.2))
                    
                Text(content)
                    .font(.subheadline)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        DetailContainer(title: "essai", content: "nom")
            .previewLayout(.sizeThatFits)
    }
}

