//
//  ClientProtocol.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import Foundation
import Combine

protocol ClientProtocol {

    /// Allows to implement the function differently for unit tests

    func get<T: Decodable>(
        dataType: T.Type,
        endPoint: Endpoint,
        paginationOffset: Int
    ) -> AnyPublisher<T, RequestError>
}
