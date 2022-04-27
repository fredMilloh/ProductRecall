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
enum PageStatus: Equatable {
    case ready (nextPaginationOffset: Int)
    case loading (paginationOffset: Int)
    case done
}

protocol HomeProtocol {
    func requestProduct(endpoint: ProductsEndpoint)
}

class HomeViewModel: ObservableObject {
    
    @ObservedObject var client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }

// MARK: - Network properties

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
    
    func getEndpoint() -> ProductsEndpoint {
        if searchInAllCategory {
            return searchWithText ?
                .whereItemInAllCategoryIs(item: searchText) :
                .allProduct
        } else {
            return searchWithText ?
                .whereItemInOneCategoryIs(item: searchText, category: selectedCategory.description) :
                .whereCategoryIs(category: selectedCategory.description)
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

extension HomeViewModel: HomeProtocol {
    
    func requestProduct(endpoint: ProductsEndpoint) {
        
        guard case let .ready(offset) = pageStatus else {
            return
        }
        /// Pending a result, the status is loading
        pageStatus = .loading(paginationOffset: offset)
        
        let response = client.get(dataType: Product.self, endPoint: endpoint, paginationOffset: offset)
        self.parse(response, with: offset)
    }
    
    func parse(_ response: AnyPublisher<Product, RequestError>, with offset: Int) {
        response.map { product in
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
}
