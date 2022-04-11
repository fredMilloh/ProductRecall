//
//  ProductDetail.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import SwiftUI

struct ProductDetail: View {
    
    let recordViewModel: RecordViewModel
    
    var body: some View {
        ScrollView {
            
            VStack {
                AsyncImage(url: recordViewModel.imageUrl) { image in
                    image.resizable()
                } placeholder: {
                    Image(systemName: "camera.fill")
                }
                .background(Color("lightGray"))
                .aspectRatio(contentMode: .fill)
                .cornerRadius(25)
                .shadow(color: .gray, radius: 5, x: 1, y: 1)
                .padding()
                DetailDescription(recordViewModel: recordViewModel)
                    .padding()
                DetailDistribution(recordViewModel: recordViewModel)
                    .padding()
                
                DetailRecall(recordViewModel: recordViewModel)
                    .padding()
                
                DetailCondition(recordViewModel: recordViewModel)
                    .padding()
                }
            }
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetail(recordViewModel: RecordViewModel(record: RecordViewModel.example))
    }
}

