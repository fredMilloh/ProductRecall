//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import SwiftUI

struct HomeListView: View {
    
    @StateObject var viewModel = HomeListViewModel()
    
    var body: some View {
        
        List(viewModel.recordList) { record in
                NavigationLink {
                    ProductDetail(
                        recordViewModel: RecordViewModel(record: record)
                    )
                } label: {
                    let viewModel = RecordViewModel(record: record)
                    RecordRow(recordViewModel: viewModel)
                }
                .onAppear(perform: {
                    viewModel.requestProduct()
                    viewModel.getNewRecords(recordItem: record)
                })
                .alert(isPresented: $viewModel.endOfList) {
                    Alert(title: Text("Oups"),
                          message: Text("An error Occurred"),
                          dismissButton: .default(Text("ok")))
                }
        }
        .onAppear(perform: {
            viewModel.requestProduct()
        })
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView()
    }
}
