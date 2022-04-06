//
//  HomeListView.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import SwiftUI

struct HomeListView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
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
                    viewModel.getNewRecords(recordItem: record)
                })
                .alert(isPresented: $viewModel.endOfList) {
                    Alert(title: Text("Oups"),
                          message: Text("there is no more"),
                          dismissButton: .default(Text("ok")))
                }
        }
        .listStyle(.plain)
        .padding(.top, -10)
        .onAppear() {
            viewModel.requestProduct(endpoint: viewModel.getEdpoint())
        }
        .onChange(of: viewModel.selectedCategory) { newValue in
            viewModel.pageStatus = PageStatus.ready(nextPaginationOffset: 0)
            viewModel.recordList.removeAll()
            viewModel.requestProduct(endpoint: viewModel.getEdpoint())
        }
    }
}

struct HomeListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeListView(viewModel: HomeViewModel()).previewLayout(.sizeThatFits)
    }
}
