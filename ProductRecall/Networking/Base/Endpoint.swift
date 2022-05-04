//
//  Endpoint.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import Foundation

/// Definition of the Endpoint protocol elements to build the url 
protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    func addURLQuery(toUrl url: URL, paginationOffset: Int) -> URL
    var method: RequestMethod { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://data.economie.gouv.fr/api/v2/"
    }
}
