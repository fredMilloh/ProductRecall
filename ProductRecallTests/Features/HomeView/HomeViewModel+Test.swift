//
//  SearchViewModel+Test.swift
//  ProductRecallTests
//
//  Created by fred on 23/03/2022.
//

import XCTest
@testable import ProductRecall

class HomeViewModel_Test: XCTestCase {
    
    var recordList: [Record] = []
    
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
    
    func test_given_empty_recordList_when_requestProduct_then_recordList_is_completed() {
        // arrange
        recordList = []
        // act
        requestProduct(endpoint: ProductsEndpoint.nothing)
        // assert
//        XCTAssertTrue(recordList.isEmpty)
    }
    
    func test_given_recordList_with_record_when_request_with_new_category_then_recordList_becomes_empty() {
        // arrange
        sut?.recordList = recordListMock
        //act
        sut?.getNewList()
        guard let newRecordList = sut?.recordList else { return }
        // assert
        XCTAssertTrue(newRecordList.isEmpty)
    }
    
    func test_given_last_recordList_when_user_scrolls_then_shouldLoadMore() {
        // arrange
        sut?.recordList = recordListMock
        let middleRecord = recordListMock[1]
        let lastRecord = recordListMock[5]
        // act
        guard let doNotLoadMore = sut?.shouldLoadMore(recordItem: middleRecord) else { return }
        guard let loadMore = sut?.shouldLoadMore(recordItem: lastRecord) else { return }
        // assert
        XCTAssertFalse(doNotLoadMore)
        XCTAssertTrue(loadMore)
        
    }
    
}

extension HomeViewModel_Test: HomeProtocol {
    
    func requestProduct(endpoint: ProductsEndpoint) {
        let products = TestCase.stubbedData(from: "product")
        print("products  = ", products as Any)
        guard let records = products?.records else { return }
        print("records = ", records)
        recordList.append(contentsOf: records)
    }
}
