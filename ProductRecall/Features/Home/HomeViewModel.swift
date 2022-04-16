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

protocol HomeProtocol {
    func requestProduct(endpoint: ProductsEndpoint)
}

class HomeViewModel: ObservableObject, HomeProtocol {

// MARK: - Network properties
        
        @ObservedObject var client = HTTPClient()
        
        @Published var recallList: [RecallViewModel] = []
        @Published var endOfList = false
        var cancellable = Set<AnyCancellable>()
        var pageStatus = PageStatus.ready(nextPaginationOffset: 0)
     
// MARK: - Search properties
        
        @Published var selectedCategory = Category.categories[1]
        @Published var searchText: String = ""
        
        /// Avoids having two network calls, one when the category is selected, another when the display is requested
        var searchWithNewCategory = true
        var searchInAllCategory: Bool {
            selectedCategory.description == Category.categories[0].description
        }
        var searchWithText: Bool {
            searchText.count > 1
        }
     
// MARK: - Request Methods
    
    func requestProduct(endpoint: ProductsEndpoint) {
        
        guard case let .ready(offset) = pageStatus else {
            return
        }
        /// Pending a result, the status is loading
        pageStatus = .loading(paginationOffset: offset)
        
        client.get(dataType: Product.self, endPoint: endpoint, paginationOffset: offset)
            .map { product in
                product.records.map { record in
                    RecallViewModel(recall: record)
                }
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] response in
                if case let .failure(error) = response {
                    print(error)
                    self?.endOfList = true
                    self?.pageStatus = .done
                }
            } receiveValue: { [weak self] recall in
                guard let self = self else { return }
                let totalCount = recall.count
                if totalCount != 0 { self.pageStatus = .done }
                self.endOfList = self.recallList.count == totalCount ? true : false
                self.pageStatus = .ready(nextPaginationOffset: offset + 100)
                self.recallList.append(contentsOf: recall)
            }
            .store(in: &cancellable)
    }
    
    func getEndpoint() -> ProductsEndpoint {
        if searchInAllCategory {
            if searchWithText {
                return ProductsEndpoint.whereItemInAllCategoryIs(item: searchText)
            } else {
                return ProductsEndpoint.allProduct
            }
        } else {
            if searchWithText {
                return ProductsEndpoint.whereItemInOneCategoryIs(item: searchText, category: selectedCategory.description)
            } else {
                return ProductsEndpoint.whereCategoryIs(category: selectedCategory.description)
            }
        }
    }
    
    func getNewList() {
        pageStatus = PageStatus.ready(nextPaginationOffset: 0)
        recallList.removeAll()
        requestProduct(endpoint: getEndpoint())
    }

    func getFollowingRecords(recordItem: RecallViewModel) {
        if !endOfList, shouldLoadMore(recordItem: recordItem) {
            requestProduct(endpoint: getEndpoint())
        }
    }
    
    func shouldLoadMore(recordItem: RecallViewModel) -> Bool {
        if let lastId = recallList.last?.id {
            return recordItem.id == lastId
        }
        return false
    }
}
