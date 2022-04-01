//
//  SearchViewModel.swift
//  ProductRecall
//
//  Created by fred on 23/03/2022.
//

import Foundation
import SwiftUI
import Combine

/// allows to manage the pagination
enum PageStatus {
    case ready (nextPaginationOffset: Int)
    case loading (paginationOffset: Int)
    case done
}

class SearchViewModel: ObservableObject {
    
    @ObservedObject var recordsFeed = HTTPClient()
    
    @Published var isSearchEnabled = false
    @Published var searchText: String = "" {
        didSet { isSearchEnabled = searchText.count > 2 }
    }
    @Published var recordList: [Record] = []
    @State var endpoint: Endpoint = ProductsEndpoint.whereCategoryIs(search: "Alimentation")
    @State var endOfList = false
    var cancellable = Set<AnyCancellable>()
    var pageStatus = PageStatus.ready(nextPaginationOffset: 0)
    
    func requestProduct() {
        
        guard case let .ready(offset) = pageStatus else {
            return
        }
        /// Pending a result, the status is loading
        pageStatus = .loading(paginationOffset: offset)
        
        recordsFeed.get(dataType: Product.self, endPoint: endpoint, paginationOffset: offset)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                if case let .failure(error) = response {
                    print(error)
                    self?.endOfList = true
                    self?.pageStatus = .done
                }
            } receiveValue: { [weak self] product in
                guard let self = self else { return }
                guard let totalCount = product.totalCount, totalCount != 0 else {
                    self.pageStatus = .done
                    return
                }
                self.endOfList = self.recordList.count == totalCount ? true : false
                self.pageStatus = .ready(nextPaginationOffset: offset + 100)
                self.recordList.append(contentsOf: product.records)
            }
            .store(in: &cancellable)
    }
}
