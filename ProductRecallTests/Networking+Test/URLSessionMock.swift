//
//  URLSessionMock.swift
//  ProductRecallTests
//
//  Created by fred M on 19/09/2022.
//

import Foundation
import Combine
@testable import ProductRecall

class URLSessionMock: URLSessionProtocol {

    var jsonName = "product.json"

    func response(for request: URLRequest) -> AnyPublisher<APIResponse, URLError> {
        let response = HTTPURLResponse(
            url: request.url!,
            statusCode: 200,
            httpVersion: "HTTP/1.1",
            headerFields: nil)!
        let file = Bundle(for: type(of: self)).path(forResource: jsonName, ofType: nil)!

        let url = URL(fileURLWithPath: file)

        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        return Just((data: data, response: response))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
    }
}

class URLSessionDataTaskMock: URLSessionDataTaskProtocol {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    func resume() {
        closure()
    }
}
