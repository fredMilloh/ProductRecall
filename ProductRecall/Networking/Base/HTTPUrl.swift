//
//  HTTPUrl.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation

protocol HTTPUrl {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    func parameters(offset: Int) -> [URLQueryItem]
}

extension HTTPUrl {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "data.economie.gouv.fr"
    }
}
