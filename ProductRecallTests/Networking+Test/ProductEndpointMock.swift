//
//  ProductEndpointMock.swift
//  ProductRecallTests
//
//  Created by fred M on 19/09/2022.
//

import Foundation
@testable import ProductRecall

enum ProductEndpointMock: Equatable {
    case test
}

extension ProductEndpointMock: Endpoint {

    var baseURL: String {
        return "www.fakeweb.com"
    }

    var path: String {
        ""
    }

    func addURLQuery(toUrl url: URL, paginationOffset: Int) -> URL {
        URL(fileURLWithPath: "")
    }

    var method: RequestMethod {
        .get
    }
}
