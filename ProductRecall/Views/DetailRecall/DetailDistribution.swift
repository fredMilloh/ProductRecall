//
//  DetailDistribution.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct DetailDistribution: View {
    
    let recall: RecallViewModel
    
    var body: some View {
        VStack {
            Divider()
            Text("Points de vente")
                .font(.title)
            VStack {
                DetailContainer(
                    title: "Magasin",
                    content: recall.distributor)
                DetailContainer(
                    title: "Région",
                    content: recall.saleGeoArea)
                DetailContainer(
                    title: "Contact",
                    content: recall.contactNumber)
            }
            .padding()
        }
    }
}

struct DetailDistribution_Previews: PreviewProvider {
    static var previews: some View {
        DetailDistribution(recall: RecallViewModel.example).previewLayout(.sizeThatFits)
    }
}

