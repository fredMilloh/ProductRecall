//
//  SearchViewModel+Test.swift
//  ProductRecallTests
//
//  Created by fred on 23/03/2022.
//

import XCTest
@testable import ProductRecall

class HomeViewModel_Test: XCTestCase {
    
    var sut: HomeViewModel?

    override func setUpWithError() throws {
        sut = HomeViewModel()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_given_searchText_when_greater_than_three_then_isSearchEnabled_is_true() {
        // arrange
        let searchtext = "orange"
        // act
        sut?.searchText = searchtext
        // assert
//        XCTAssertTrue(((sut?.isSearchEnabled) != nil))
    }
    
}
