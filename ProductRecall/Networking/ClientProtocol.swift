//
//  ClientProtocol.swift
//  ProductRecall
//
//  Created by fred on 01/04/2022.
//

import Foundation
import Combine

protocol ClientProtocol {
    
    func get<T: Decodable>(
        dataType: T.Type,
        endPoint: Endpoint,
        paginationOffset: Int
    ) -> AnyPublisher<T, RequestError>
}
