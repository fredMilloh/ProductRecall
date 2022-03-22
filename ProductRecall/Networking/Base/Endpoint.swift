//
//  Endpoint.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    func addURLQueryParameters(toUrl url: URL, offset: Int) -> URL
    var method: RequestMethod { get }
    
}

extension Endpoint {
    var baseURL: String {
        return "https://data.economie.gouv.fr/api/v2/"
    }
}
