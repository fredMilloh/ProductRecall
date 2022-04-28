//
//  ImageAsync.swift
//  ProductRecall
//
//  Created by fred on 28/04/2022.
//

import SwiftUI

struct ImageAsync: View {
    
    var url: URL
    
    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            Image(systemName: "camera.fill")
                .foregroundColor(.primary)
        }
        .background(Color("lightGray"))
        .cornerRadius(10)
        .shadow(color: .gray, radius: 2, x: 1, y: 1)
    }
}

struct ImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        ImageAsync(url: URL(fileURLWithPath: ""))
            .previewLayout(.sizeThatFits)
    }
}
