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

class HomeViewModel: ObservableObject {

// MARK: - Network properties
        
        @ObservedObject var client = HTTPClient()
        
        @Published var recordList: [Record] = [] 
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
            searchText.count > 1 ? true : false
        }
     
// MARK: - Request Methods
    
    func requestProduct(endpoint: ProductsEndpoint) {
        
        guard case let .ready(offset) = pageStatus else {
            return
        }
        /// Pending a result, the status is loading
        pageStatus = .loading(paginationOffset: offset)
        
        client.get(dataType: Product.self, endPoint: endpoint, paginationOffset: offset)
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
    
    func getEndpoint() -> ProductsEndpoint {
        if searchInAllCategory {
            if searchWithText {
                print("recherche \(searchText) dans toutes les catégories")
                return ProductsEndpoint.whereItemInAllCategoryIs(item: searchText)
            } else {
                print("recherche toutes cat sans text")
                return ProductsEndpoint.allProduct
            }
        } else {
            if searchWithText {
                print("recherche \(searchText) dans catégorie \(selectedCategory.description)")
                return ProductsEndpoint.whereItemInOneCategoryIs(item: searchText, category: selectedCategory.description)
            } else {
                print("recherche sans text dans catégory \(selectedCategory.description)")
                return ProductsEndpoint.whereCategoryIs(category: selectedCategory.description)
            }
        }
    }
    
    func getNewList() {
        pageStatus = PageStatus.ready(nextPaginationOffset: 0)
        recordList.removeAll()
        requestProduct(endpoint: getEndpoint())
    }

    func getFollowingRecords(recordItem: Record) {
        if !endOfList, shouldLoadMore(recordItem: recordItem) {
            requestProduct(endpoint: getEndpoint())
        }
    }
    
    private func shouldLoadMore(recordItem: Record) -> Bool {
        if let lastId = recordList.last?.id {
            return recordItem.id == lastId ? true : false
        }
        return false
    }
}
