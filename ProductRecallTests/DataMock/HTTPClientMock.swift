//
//  HTTPClientMock.swift
//  ProductRecallTests
//
//  Created by fred on 26/04/2022.
//

import Foundation
import Combine
@testable import ProductRecall

class HTTPClientMock: HTTPClient {

    override func get<T>(dataType: T.Type,
                         endPoint: Endpoint,
                         paginationOffset: Int) -> AnyPublisher<T, RequestError> where T: Decodable {
        let response = HTTPURLResponse(url: URL(fileURLWithPath: ""),
                                       statusCode: 200, httpVersion: "HTTP/1.1",
                                       headerFields: nil)!
        let dataJson = "product.json".data(using: .utf8)!

        return Just((data: dataJson, response: response))
            .setFailureType(to: RequestError.self)
            .flatMap(maxPublishers: .max(1), { output in
                self.decode(output.data)
            })
            .eraseToAnyPublisher()
    }

    func decode<Product: Decodable>(_ data: Data) -> AnyPublisher<Product, RequestError> {
        return Just(data)
            .decode(type: Product.self, decoder: JSONDecoder())
            .mapError { _ in
                RequestError.decode
            }
            .eraseToAnyPublisher()
    }
}
