//
//  EmptySelectedMessage.swift
//  ProductRecall
//
//  Created by fred on 18/04/2022.
//

import SwiftUI

struct EmptySelectedMessage: View {
    
    let box = Image(systemName: "flag")
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "flag.slash.circle.fill")
              .imageScale(.large)
              .font(.largeTitle)
              .foregroundColor(.pink)
            Text(
            """
            Il n'y a pas de rappels retenus.
            
            Appuyer sur \(box)
            en haut à droite dans la visualisation du détail,
            ou à droite dans la liste,
            
            pour retenir le rappel.
            """
            )
            .foregroundColor(.secondary)
            .symbolRenderingMode(.multicolor)
            .multilineTextAlignment(.center)
        }
    }
}

struct EmptySelectedMessage_Previews: PreviewProvider {
    static var previews: some View {
        EmptySelectedMessage()
    }
}
