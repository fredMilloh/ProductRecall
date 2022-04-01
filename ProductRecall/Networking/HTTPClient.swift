//
//  HTTPClient.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation
import Combine

class HTTPClient : ObservableObject {
    
    private var session = URLSession.shared
    
    private func parse<T: Decodable>(_ data: Data) -> AnyPublisher<T, RequestError> {
        return Just(data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                RequestError.decode
            }
            .eraseToAnyPublisher()
    }
}

extension HTTPClient: ClientProtocol {
    
    func get<T: Decodable>(
        dataType: T.Type,
        endPoint: Endpoint,
        paginationOffset: Int
    ) -> AnyPublisher<T, RequestError> {
        
        guard let url = URL(string: endPoint.baseURL + endPoint.path) else {
            let urlError = RequestError.invalidURL
            return Fail(error: urlError).eraseToAnyPublisher()
        }
        var request = URLRequest(url: endPoint.addURLQuery(toUrl: url, paginationOffset: paginationOffset))
        request.httpMethod = endPoint.method.rawValue
  print("request = ", request)
        
        return session.dataTaskPublisher(for: request)
            .mapError { error in
                RequestError.unauthorized
            }
            .flatMap(maxPublishers: .unlimited) { output in
                self.parse(output.data)
            }
            .eraseToAnyPublisher()
    }
}
