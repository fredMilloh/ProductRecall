//
//  ShareSheet+Tests.swift
//  ProductRecallTests
//
//  Created by fred on 24/04/2022.
//

import XCTest
@testable import ProductRecall

class ShareSheet_Tests: XCTestCase {
    
    var sut: ShareSheet?

    override func setUpWithError() throws {
        sut = ShareSheet(activityItems: .constant(["test"]))
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

}
