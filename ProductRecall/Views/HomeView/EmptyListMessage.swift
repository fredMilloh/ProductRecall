//
//  EmptyListMessage.swift
//  ProductRecall
//
//  Created by fred on 05/05/2022.
//

import SwiftUI

struct EmptyListMessage: View {
    var body: some View {
        VStack {
            Text("Oups...")
            Text("aucun résultat")
            Text("trouvé")
        }
        .font(.title2)
        .foregroundColor(.white)
        .frame(width: 200, height: 200, alignment: .center)
        .background(Color.teal)
        .clipShape(Circle())
    }
}

struct EmptyListMessage_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListMessage()
    }
}
