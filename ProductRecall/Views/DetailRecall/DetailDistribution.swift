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
            Text("Points de vente")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80, alignment: .center)
                .foregroundColor(Color.primary.opacity(0.5))
                .background(.green)
            VStack {
                DetailContainer(title: "Magasin", content: recall.distributor)
                DetailContainer(title: "Région", content: recall.saleGeoArea)
                DetailContainer(title: "Contact", content: recall.contactNumber)
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

