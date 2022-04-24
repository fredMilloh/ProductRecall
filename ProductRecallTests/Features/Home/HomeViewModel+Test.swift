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
    
    var recallListMock: [RecallViewModel] = []
    
    var sut: HomeViewModel?

    override func setUpWithError() throws {
        sut = HomeViewModel()
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
        sut?.selectedCategory = Category(id: 1, name: "Toutes", description: "Toutes catégories", icon: "all")
        sut?.searchText = "lemon"
        // act
        guard let endpoint = sut?.getEndpoint() else { return }
        let endpointshouldBe = ProductsEndpoint.whereItemInAllCategoryIs(item: "lemon")
        // assert
        XCTAssertEqual(endpoint, endpointshouldBe)
    }
    
    func test_given_searchText_isEmpty_when_search_in_allCategory_then_ProductEnpoint_case_is_allProduct() {
        // arrange
        sut?.selectedCategory = Category(id: 1, name: "Toutes", description: "Toutes catégories", icon: "all")
        sut?.searchText = ""
        // act
        guard let endpoint = sut?.getEndpoint() else { return }
        let endpointShouldBe = ProductsEndpoint.allProduct
        // assert
        XCTAssertEqual(endpoint, endpointShouldBe)
    }
    
    func test_given_searchWithText_when_search_in_specific_category_then_ProductEndpoint_case_is_whereItemInOneCategoryIs() {
        // arrange
        sut?.selectedCategory = Category(id: 5, name: "Hygiène", description: "Hygiène-Beauté", icon: "hygiene")
        sut?.searchText = "savon"
        // act
        guard let endpoint = sut?.getEndpoint() else { return }
        let endpointShouldBe = ProductsEndpoint.whereItemInOneCategoryIs(item: "savon", category: "Hygiène-Beauté")
        // assert
        XCTAssertEqual(endpoint, endpointShouldBe)
    }
    
    func test_given_searchText_isEmpty_when_search_in_specific_category_then_ProductEndpoint_case_is_whereCategoryIs() {
        // arrange
        sut?.selectedCategory = Category(id: 2, name: "Alimentation", description: "Alimentation", icon: "supply")
        sut?.searchText = ""
        // act
        guard let endpoint = sut?.getEndpoint() else { return }
        let endpointShouldBe = ProductsEndpoint.whereCategoryIs(category: "Alimentation")
        // assert
        XCTAssertEqual(endpoint, endpointShouldBe)
    }
    
    func test_given_empty_recallList_when_requestProduct_then_recallList_is_completed() {
        // arrange
        recallListMock = []
        // act
        requestProduct(endpoint: .allProduct)
        // assert
        XCTAssertFalse(recallListMock.isEmpty)
    }
    
    func test_given_recallList_with_recall_when_request_with_new_category_then_recallList_becomes_empty() {
        // arrange
        requestProduct(endpoint: .allProduct)
        //act
        sut?.getNewList()
        guard let newRecallList = sut?.recallList else { return }
        // assert
        XCTAssertTrue(newRecallList.isEmpty)
    }
    
    func test_given_last_recallList_when_user_scrolls_then_shouldLoadMore() {
        // arrange
        let response = Result<Product, RequestError>
            .Publisher(Product(records: []))
            .eraseToAnyPublisher()
        
        sut?.parse(response, with: 2)
        
        requestProduct(endpoint: .allProduct)
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
}

extension HomeViewModel_Test: HomeProtocol {

    func requestProduct(endpoint: ProductsEndpoint) {

        for record in listMock {
            let converted = RecallViewModel(recall: record)
            recallListMock.append(converted)
        }
    }
}
