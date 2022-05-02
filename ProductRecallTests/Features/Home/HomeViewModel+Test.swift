//
//  SearchViewModel+Test.swift
//  ProductRecallTests
//
//  Created by fred on 23/03/2022.
//

import Combine
import SwiftUI
import XCTest
@testable import ProductRecall

class HomeViewModel_Test: XCTestCase {
    
    private var cancellable = Set<AnyCancellable>()
    
    var recallListMock: [RecallViewModel] = []
    
    let clientMock = HTTPClientMock()
    var sut: HomeViewModel?

    override func setUpWithError() throws {
        sut = HomeViewModel(client: clientMock)
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_given_searchText_when_greater_than_one_then_searchWithText_is_true() {
        // arrange
        let searchtext = "orange"
        // act
        sut?.searchText = searchtext
        // assert
        XCTAssertEqual(sut?.searchWithText, true)
    }
    
    func test_given_category_when_is_all_then_searchInAllCategory_is_true() {
        //arrange
        let category = Category(id: 1, name: "Toutes", description: "Toutes catégories", icon: "all")
        // act
        sut?.selectedCategory = category
        // assert
        XCTAssertEqual(sut?.searchInAllCategory, true)
    }
    
    func test_given_searchWithText_when_search_in_allCategory_then_ProductEndpoint_case_is_whereItemInAllCategoryIs() {
        // arrange
        guard let sut = sut else { return }
        sut.selectedCategory = Category(id: 1, name: "Toutes", description: "Toutes catégories", icon: "all")
        sut.searchText = "lemon"
        // act
        let endpoint = sut.getEndpoint()
        
        // assert
        XCTAssertEqual(endpoint, .whereItemInAllCategoryIs(item: "lemon"))
    }
    
    func test_given_searchText_isEmpty_when_search_in_allCategory_then_ProductEnpoint_case_is_allProduct() {
        // arrange
        guard let sut = sut else { return }
        sut.selectedCategory = Category(id: 1, name: "Toutes", description: "Toutes catégories", icon: "all")
        sut.searchText = ""
        // act
        let endpoint = sut.getEndpoint()
        // assert
        XCTAssertEqual(endpoint, .allProduct)
    }
    
    func test_given_searchWithText_when_search_in_specific_category_then_ProductEndpoint_case_is_whereItemInOneCategoryIs() {
        // arrange
        guard let sut = sut else { return }
        sut.selectedCategory = Category(id: 5, name: "Hygiène", description: "Hygiène-Beauté", icon: "hygiene")
        sut.searchText = "savon"
        // act
        let endpoint = sut.getEndpoint()
        // assert
        XCTAssertEqual(endpoint, .whereItemInOneCategoryIs(item: "savon", category: "Hygiène-Beauté"))
    }
    
    func test_given_searchText_isEmpty_when_search_in_specific_category_then_ProductEndpoint_case_is_whereCategoryIs() {
        // arrange
        guard let sut = sut else { return }
        sut.selectedCategory = Category(id: 2, name: "Alimentation", description: "Alimentation", icon: "supply")
        sut.searchText = ""
        // act
        let endpoint = sut.getEndpoint()
        // assert
        XCTAssertEqual(endpoint, .whereCategoryIs(category: "Alimentation"))
    }
    
    func test_given_empty_recallList_when_requestProduct_then_recallList_is_completed() {
        // arrange
        recallListMock = []
        // act
        for record in listMock.records {
        	let converted = RecallViewModel(recall: record)
        	recallListMock.append(converted)
    	}
        // assert
        XCTAssertFalse(recallListMock.isEmpty)
    }
    
    func test_given_recallList_with_recall_when_request_with_new_category_then_recallList_becomes_empty() {
        // arrange
        sut?.selectedCategory = Category(id: 7, name: "Sports", description: "Sports-loisirs", icon: "sport")
        //act
        sut?.getNewList()
        guard let newRecallList = sut?.recallList else { return }
        // assert
        XCTAssertTrue(newRecallList.isEmpty)
    }
    
    func test_given_last_recallList_when_user_scrolls_then_shouldLoadMore() {
        // arrange
        
        for record in listMock.records {
            let converted = RecallViewModel(recall: record)
            recallListMock.append(converted)
        }
        
        sut?.recallList = recallListMock
        let middleRecall = recallListMock[1]
        let lastRecall = recallListMock[9]
        sut?.endOfList = false
        // act
        guard let doNotLoadMore = sut?.shouldLoadMore(recordItem: middleRecall) else { return }
        guard let loadMore = sut?.shouldLoadMore(recordItem: lastRecall) else { return }
        sut?.getFollowingRecords(recordItem: lastRecall)
        // assert
        XCTAssertFalse(doNotLoadMore)
        XCTAssertTrue(loadMore)
    }
    
    func test_requestProduct_with_mock_data() {
        guard let sut = sut else { return }
        let expectation = self.expectation(description: "parsing")
        
        
        requestProduct(endpoint: .allProduct)
        expectation.fulfill()
        
        waitForExpectations(timeout: 10)
        XCTAssertEqual(sut.pageStatus, .loading(paginationOffset: 0))
//        XCTAssertEqual(recallListMock.count, 9)
        
    }
}

extension HomeViewModel_Test: HomeProtocol {
    
    func requestProduct(endpoint: ProductsEndpoint) {
        guard let sut = sut else { return }
        guard case let .ready(offset) = sut.pageStatus else {
            return
        }
        sut.pageStatus = .loading(paginationOffset: offset)
        
        let jsonMock = clientMock.get(dataType: Product.self, endPoint: ProductsEndpoint.allProduct, paginationOffset: 15)
//        let jsonMock = clientMock.get()
        jsonMock.map { product in
            product.records.map { record in
                RecallViewModel(recall: record)
            }
        }
        .receive(on: DispatchQueue.main)
        .sink { mockResponse in
            if case let .failure(error) = mockResponse {
                print(error)
                sut.endOfList = true
                sut.pageStatus = .done
            }
        } receiveValue: { [weak self] recall in
            guard let self = self else { return }
            let totalCount = recall.count
            if totalCount != 0 { sut.pageStatus = .done }
            sut.endOfList = self.recallListMock.count == totalCount ? true : false
            sut.pageStatus = .ready(nextPaginationOffset: offset + 100)
            self.recallListMock.append(contentsOf: recall)
        }
        .store(in: &cancellable)
    }
}
