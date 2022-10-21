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

class HomeViewModel: ObservableObject {

    var client = HTTPClient(session: URLSession.shared)

	// MARK: - Network properties

    @Published var recallList: [RecallViewModel] = []
    @Published var endOfList = false

    var totalCount = 0
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

        guard case let .ready(offset) = pageStatus else { return }
        /// Pending a result, the status is loading
        pageStatus = .loading(paginationOffset: offset)

        let response = client.get(dataType: Product.self, endPoint: endpoint, paginationOffset: offset)
        response
            .receive(on: DispatchQueue.main)
        // Subscriber failure type
            .sink { [weak self] response in
                if case let .failure(error) = response {
                    print(error)
                    self?.endOfList = true
                    self?.pageStatus = .done
                }
        // subscriber input type
            } receiveValue: { [weak self] product in
                guard let self = self, let count = product.count else { return }
                self.totalCount = count
                self.endOfList = self.recallList.count == self.totalCount ? true : false
                self.pageStatus = .ready(nextPaginationOffset: offset + 100)

                product.records.forEach { record in
                    let recall = RecallViewModel(recall: record)
                    self.recallList.append(recall)
                }
            }
        // Store subscription
            .store(in: &cancellable)
    }

    /// Set the endpoint according to the category and possible search text
    func getEndpoint() -> ProductsEndpoint {
        if searchInAllCategory {
            return searchWithText ?
                .whereItemInAllCategoryIs(item: searchText) :
                .allProduct
        }
        return searchWithText ?
            .whereItemInOneCategoryIs(item: searchText, category: selectedCategory.description) :
            .whereCategoryIs(category: selectedCategory.description)
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
