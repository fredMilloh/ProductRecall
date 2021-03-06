//
//  HTTPClient.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation
import Combine

class HTTPClient {

    var session = URLSession(configuration: .default)

    /// Decode data
    func parse<T: Decodable>(_ data: Data) -> AnyPublisher<T, RequestError> {
        return Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in
                RequestError.decode
            }
            .eraseToAnyPublisher()
    }
}

extension HTTPClient: ClientProtocol {

    /// Implementation of the protocol function for network calls

    func get<T: Decodable>(
        dataType: T.Type,
        endPoint: Endpoint,
        paginationOffset: Int
    ) -> AnyPublisher<T, RequestError> {

        /// Constitution of the URLRequest according to the Endpoint protocol
        guard let url = URL(string: endPoint.baseURL + endPoint.path) else {
            let urlError = RequestError.invalidURL
            return Fail(error: urlError).eraseToAnyPublisher()
        }
        var request = URLRequest(url: endPoint.addURLQuery(toUrl: url, paginationOffset: paginationOffset))
        request.httpMethod = endPoint.method.rawValue

        return session.dataTaskPublisher(for: request)
            .mapError { _ in
                RequestError.unauthorized
            }
            .flatMap(maxPublishers: .unlimited) { output in
                self.parse(output.data)
            }
            .eraseToAnyPublisher()
    }
}
