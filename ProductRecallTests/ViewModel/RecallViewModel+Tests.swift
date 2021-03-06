//
//  RecallViewModel+Tests.swift
//  ProductRecallTests
//
//  Created by fred on 21/03/2022.
//

import XCTest
@testable import ProductRecall
import SwiftUI

class RecallViewModelTests: XCTestCase {

    var sut: RecallViewModel?
    let record = example

    override func setUpWithError() throws {
        sut = RecallViewModel(recall: record)
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func test_given_properties_when_display_then_fields_matched() {
        XCTAssertEqual(sut?.category, record.category)
        XCTAssertEqual(sut?.subCategory, record.subCategory)
        XCTAssertEqual(sut?.brandName, record.brandName)
        XCTAssertEqual(sut?.modelName, record.modelName)
        XCTAssertEqual(sut?.productId, record.productId)
        XCTAssertEqual(sut?.packaging, record.packaging)
        XCTAssertEqual(sut?.infos, record.infos)
        XCTAssertEqual(sut?.marketingDates, record.marketingDates)
        XCTAssertEqual(sut?.storageTemperature, record.storageTemperature)
        XCTAssertEqual(sut?.healthMark, record.healthMark)
        XCTAssertEqual(sut?.distributor, record.distributor)
        XCTAssertEqual(sut?.saleGeoArea, record.saleGeoArea)
        XCTAssertEqual(sut?.contactNumber, record.contactNumber)
        XCTAssertEqual(sut?.reasonRecall, record.reasonRecall)
        XCTAssertEqual(sut?.risksIncurred, record.risksIncurred)
        XCTAssertEqual(sut?.healthRecommendations, record.healthRecommendations)
        XCTAssertEqual(sut?.additionalRiskDescription, record.additionalRiskDescription)
        XCTAssertEqual(sut?.actionsToTake, record.actionsToTake)
        XCTAssertEqual(sut?.compensationTerms, record.compensationTerms)
        XCTAssertEqual(sut?.endDateRecall, record.endDateRecall)
        XCTAssertEqual(sut?.otherInfos, record.otherInfos)
        XCTAssertEqual(sut?.legalCharacter, record.legalCharacter)
    }

    func test_given_imageUrlString_when_image_called_then_first_image_URL_is_returned() {
        // arrange
        let urlImageShouldBe = URL(string: "http://rappel.conso.gouv.fr/image/998281b2-5ede.jpg")
        // act & assert
        XCTAssertEqual(sut?.imageUrl, urlImageShouldBe)
    }

    func test_given_flyerStringImage_when_image_called_then_flyer_URL_is_returned() {
        // arrange
        let flyerUrlShouldBe = URL(string: "http://rappel.conso.gouv.fr/affichettePDF/6347/Interne")
        // act & assert
        XCTAssertEqual(sut?.flyerImageLink, flyerUrlShouldBe)
    }
}
