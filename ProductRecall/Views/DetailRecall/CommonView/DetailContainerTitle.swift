//
//  DetailContainerTitle.swift
//  ProductRecall
//
//  Created by fred on 28/04/2022.
//

import SwiftUI

struct DetailContainerTitle: View {
    
    var title: String
    var color: Color
    
    var body: some View {
        Text(title)
            .font(.title2)
            .bold()
            .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80, alignment: .center)
            .foregroundColor(Color.primary.opacity(0.6))
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [color, color.opacity(0.6)]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

struct DetailContainerTitle_Previews: PreviewProvider {
    static var previews: some View {
        DetailContainerTitle(title: "titre", color: .blue)
    }
}
