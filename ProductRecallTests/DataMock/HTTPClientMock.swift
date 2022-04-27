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
            
    override func get<T>(dataType: T.Type, endPoint: Endpoint, paginationOffset: Int) -> AnyPublisher<T, RequestError> where T : Decodable {
        
        let bundle = Bundle(for: TestCase.self)
        let url = bundle.url(forResource: "product", withExtension: "json") ?? URL(fileURLWithPath: "www")
        
  print("request = ", url)

        return session.dataTaskPublisher(for: url)
            .mapError { error in
                RequestError.unauthorized
            }
            .flatMap(maxPublishers: .unlimited) { output in
                self.parse(output.data)
            }
            .eraseToAnyPublisher()
    }

}
