//
//  ProductUrl.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation

enum ProductUrl {
    case allProduct
    case whereCategoryIs(search: String)
}

extension ProductUrl: HTTPUrl {
    
    var path: String {
        switch self {
        case .allProduct, .whereCategoryIs:
            return "/api/v2/catalog/datasets/rappelconso0/records"
        }
    }

    func parameters(offset: Int) -> [URLQueryItem] {
        switch self {
        case .allProduct:
            return [
                URLQueryItem(name: "order_by", value: "date_ref desc"),
                URLQueryItem(name: "limit", value: "100"),
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "timezone", value: "Europe/Paris")
            ]
        case .whereCategoryIs(let search):
            return [
                URLQueryItem(name: "where=categorie_de_produit", value: "\(search)"),
                URLQueryItem(name: "order_by", value: "date_ref desc"),
                URLQueryItem(name: "limit", value: "100"),
                URLQueryItem(name: "offset", value: String(offset)),
                URLQueryItem(name: "timezone", value: "Europe/Paris")
            ]
        }
    }

}
