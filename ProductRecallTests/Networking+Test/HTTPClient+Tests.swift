//
//  HTTPClient+Tests.swift
//  ProductRecallTests
//
//  Created by fred M on 19/09/2022.
//

import XCTest
import Combine
@testable import ProductRecall

class HTTPClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var urlSession: URLSessionMock?
    var httpClient: HTTPClient<URLSessionMock>?

    var publisher: AnyCancellable?
    var cancellable = Set<AnyCancellable>()
    var response: Publishers.ReceiveOn<AnyPublisher<Product, RequestError>, DispatchQueue>?

    func testSuccessfullURLresponse() {
        urlSession = URLSessionMock()
        httpClient = HTTPClient(session: urlSession!)
        let expect = expectation(description: #function)

        response = httpClient?.get(
            dataType: Product.self,
            endPoint: ProductEndpointMock.test,
            paginationOffset: 10)
        .receive(on: DispatchQueue.main)

        publisher = response!.sink(receiveCompletion: { _ in
        }, receiveValue: { product in
            guard let count = product.count else { return }
            let modelName = product.records[1].modelName
            XCTAssertEqual(count, 5101)
            XCTAssertEqual(modelName, "NETTOYANT MOTO. Marque MAXXE. Contenance 1L. Référence NETTOYANTMOTOMAXXE.")

            expect.fulfill()
        })
        waitForExpectations(timeout: 1.0)
    }

    func testFailureURLresponse() {
        urlSession = URLSessionMock()
        urlSession?.jsonName = "badProduct.json"
        httpClient = HTTPClient(session: urlSession!)
        let expect = expectation(description: #function)

        response = httpClient?.get(
            dataType: Product.self,
            endPoint: ProductEndpointMock.test,
            paginationOffset: 10)
        .receive(on: DispatchQueue.main)

        publisher = response!.sink(receiveCompletion: {
            print($0)
            switch $0 {
            case .finished: break
            case .failure(let error):
                XCTAssertEqual( (error as NSError).code, 0 )
            }
            expect.fulfill()
        }, receiveValue: { error in
            XCTFail("failure URLSession: \(error)")
        })
        waitForExpectations(timeout: 1.0)
    }
}
