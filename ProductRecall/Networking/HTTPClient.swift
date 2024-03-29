//
//  HTTPClient.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation
import Combine

class HTTPClient<T: URLSessionProtocol>: HTTPClientProtocol {

    let session: T

    required init(session: T) {
        self.session = session
    }

    var callCount = 0
    /// Implementation of the protocol function for network calls
    func get<T: Decodable>(
        dataType: T.Type,
        endPoint: Endpoint,
        paginationOffset: Int
    ) -> AnyPublisher<T, RequestError> {

        callCount += 1

        /// Constitution of the URLRequest according to the Endpoint protocol
        guard let url = URL(string: endPoint.baseURL + endPoint.path) else {
            return Fail(outputType: T.self, failure: RequestError.invalidURL).eraseToAnyPublisher()
        }
        var request = URLRequest(url: endPoint.addURLQuery(toUrl: url, paginationOffset: paginationOffset))
        request.httpMethod = endPoint.method.rawValue

        return session.response(for: request)
            .mapError { _ in
                RequestError.unauthorized
            }
            .flatMap(maxPublishers: .unlimited) { output in
                return Just(output.data)
                    .decode(type: T.self, decoder: JSONDecoder())
                    .mapError { _ in
                        RequestError.decode
                    }
            }
            .eraseToAnyPublisher()
    }
}
