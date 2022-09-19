//
//  HTTPClientMock.swift
//  ProductRecallTests
//
//  Created by fred on 26/04/2022.
//

import Foundation
import Combine
@testable import ProductRecall

class HTTPClientMock <T: URLSessionProtocol>: HTTPClientProtocol {

    let session: T

    required init(session: T) {
        self.session = session
    }

    var getCallCount = 0

    func get<T>(
        dataType: T.Type,
        endPoint: Endpoint,
        paginationOffset: Int
    ) -> AnyPublisher<T, RequestError> where T: Decodable {

        getCallCount += 1

        guard let url = URL(string: endPoint.baseURL + endPoint.path) else {
            return Fail(outputType: T.self, failure: RequestError.invalidURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: endPoint.addURLQuery(toUrl: url, paginationOffset: paginationOffset))
        request.httpMethod = endPoint.method.rawValue

        // let session = URLSessionMock()
        return session.response(for: request)
            .mapError { _ in
                RequestError.unauthorized
            }
            .flatMap(maxPublishers: .unlimited, { output in
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
