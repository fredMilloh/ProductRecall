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
            Link(destination: url) {
                HStack(alignment: .firstTextBaseline) {
                    Text("Voir et partager en PDF")
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.blue)
                }
            }
        }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(url: URL(fileURLWithPath: ""))
    }
}
