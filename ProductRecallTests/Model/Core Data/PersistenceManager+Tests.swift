//
//  PersistenceManager+Tests.swift
//  ProductRecallTests
//
//  Created by fred on 22/04/2022.
//

import XCTest
import CoreData
@testable import ProductRecall

class PersistenceManagerTests: XCTestCase {

    var sut: PersistenceManager?
    var testCoreDataStack: TestCoreDataStack!

    let recallTest = RecallViewModel(recall: example)
    let recallTest2 = RecallViewModel(recall: example2)

    override func setUpWithError() throws {
        testCoreDataStack = TestCoreDataStack()
        sut = PersistenceManager(
            coreDataStack: testCoreDataStack
        )
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        testCoreDataStack = nil
        sut = nil
        try super.tearDownWithError()
    }

    func test_given_one_recall_when_is_selected_then_it_becomes_persistent() {
        // arrange
        guard let sut = sut else { return }
        let ref = recallTest.cardRef
        // act
        sut.save(recall: recallTest) { _ in
        // assert
            XCTAssertTrue(sut.getIsSelected(from: ref))
        }
    }

    func test_given_there_is_one_persistent_when_it_is_deleted_then_is_not_longer_persistent() {
        // arrange
        guard let sut = sut else { return }
        let ref = recallTest.cardRef
        // act
        sut.delete(cardRef: ref) { _ in}
        // assert
        XCTAssertFalse(sut.getIsSelected(from: ref))
    }

    func test_given_there_is_no_persistent_when_check_selected_then_array_of_selected_is_empty() {
        // arrange
        guard let sut = sut else { return }
        // act
        sut.fetchSelected()
        // assert
        XCTAssertTrue(sut.recallSelected.isEmpty)
    }

    func test_given_there_is_one_persistent_when_save_another_one_and_fetch_them_then_array_count_is_two() {
        // arrange
        guard let sut = sut else { return }
        sut.save(recall: recallTest) { _ in}
        sut.fetchSelected()
        XCTAssertEqual(sut.recallSelected.count, 1)
        // act
        sut.save(recall: recallTest2) { _ in}
        sut.fetchSelected()
        let numberOfSelectedShouldBe = 2
        // assert
        XCTAssertEqual(sut.recallSelected.count, numberOfSelectedShouldBe)
    }

    func test_given_there_is_two_persistent_when_deleted_one_and_fetch_then_array_count_is_one() {
        // arrange
        guard let sut = sut else { return }
        sut.save(recall: recallTest) { _ in}
        sut.save(recall: recallTest2) { _ in}
        sut.fetchSelected()
        XCTAssertEqual(sut.recallSelected.count, 2)
        let ref = recallTest.cardRef
        // act
        sut.delete(cardRef: ref) { _ in}
        sut.fetchSelected()
        let numberOfSelectedShouldBe = 1
        // assert
        XCTAssertEqual(sut.recallSelected.count, numberOfSelectedShouldBe)
    }

    func test_given_recall_is_persistent_when_toggle_persistence_then_is_no_longer_persistent() {
        // arrange
        guard let sut = sut else { return }
        recallTest2.isPersistent = true
        sut.save(recall: recallTest2) { _ in}
        let ref = recallTest2.cardRef
        // act
        sut.togglePersistence(from: ref, recall: recallTest2)
        // arrange
        XCTAssertFalse(sut.getIsSelected(from: ref))
    }

    func test_given_recall_is_not_persistent_when_toggle_persistence_then_is_becomes_persistent() {
        // arrange
        guard let sut = sut else { return }
        recallTest.isPersistent = false
        let ref = recallTest.cardRef
        // act
        sut.togglePersistence(from: ref, recall: recallTest)
        // arrange
        XCTAssertTrue(sut.getIsSelected(from: ref))
        // reset
        sut.delete(cardRef: ref) { _ in}
    }
}
