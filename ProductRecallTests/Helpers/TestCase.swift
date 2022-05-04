//
//  TestCase.swift
//  ProductRecallTests
//
//  Created by fred on 21/03/2022.
//

import XCTest
@testable import ProductRecall

class TestCase: XCTestCase {

    static func stubbedData( from json: String) -> [Record]? {
        let bundle = Bundle(for: TestCase.self)
        let url = bundle.url(forResource: json, withExtension: "json") ?? URL(fileURLWithPath: "www")
        let data = (try? Data(contentsOf: url)) ?? Data()
        return try? JSONDecoder().decode([Record].self, from: data)
    }
}
