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
                    .padding(.bottom, -3)
                    
                Text(content)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.leading, 5)
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

