//
//  LinkView.swift
//  ProductRecall
//
//  Created by fred on 28/04/2022.
//

import SwiftUI

struct LinkView: View {

    let url: URL

    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.blue)
            Link("Partager le PDF du rappel", destination: url)
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(url: URL(fileURLWithPath: ""))
    }
}
