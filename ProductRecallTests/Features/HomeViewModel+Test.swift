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

class HomeViewModelTest: XCTestCase {

    private var cancellable = Set<AnyCancellable>()

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
        // arrange
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

    func test_given_searchWithText_when_search_in_specific_category_then_ProductEndpoint_case_is_correct() {
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
        // act
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

    func test_parse_response_with_mock_data() {
        guard let sut = sut else { return }
        let urlSession = URLSessionMock()
        urlSession.jsonName = "product.json"
        let httpClient = HTTPClientMock(session: urlSession)

        let response = httpClient.get(dataType: Product.self, endPoint: ProductEndpointMock.test, paginationOffset: 10)

        response
            .sink(receiveCompletion: {
                print($0)
                switch $0 {
                case .finished: break
                case .failure(let error):
                    XCTAssertEqual( (error as NSError).code, 0 )
                }
            }, receiveValue: { product in
                guard let count = product.count else { return }
                sut.totalCount = count
                sut.parse(response, with: 10)
            })
            .store(in: &cancellable)

        XCTAssertEqual(httpClient.getCallCount, 1)
        XCTAssertEqual(sut.pageStatus, .ready(nextPaginationOffset: 0))
    }
}
