//
//  ProductsEndpoint.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import Foundation

enum ProductsEndpoint: Equatable {
    case allProduct
    case whereCategoryIs(category: String)
    case whereItemInAllCategoryIs(item: String)
    case whereItemInOneCategoryIs(item: String, category: String)
}

extension ProductsEndpoint: Endpoint {

    /// Construction of the url with parameters according to the Endpoint protocol

    var path: String {
        switch self {
        case .allProduct, .whereCategoryIs, .whereItemInAllCategoryIs, .whereItemInOneCategoryIs:
            return "catalog/datasets/rappelconso0/records?"
        }
    }

    func addURLQuery(toUrl url: URL, paginationOffset: Int) -> URL {
        guard var urlComponents = URLComponents(
            url: url,
            resolvingAgainstBaseURL: false
        ) else { return url }

        var queryItems = [
            URLQueryItem(name: "order_by", value: "reference_fiche desc"),
            URLQueryItem(name: "limit", value: "100"),
            URLQueryItem(name: "offset", value: String(paginationOffset))
        ]

        var additionalQueryItem: URLQueryItem?

        switch self {
        case .whereCategoryIs(let category):
            additionalQueryItem = URLQueryItem(name: "where", value: "categorie_de_produit = \"\(category)\"")
        case .whereItemInAllCategoryIs(let item):
            additionalQueryItem = URLQueryItem(name: "where", value: "\"\(item)\"")
        case .whereItemInOneCategoryIs(let item, let category):
            additionalQueryItem = URLQueryItem(
                name: "where",
                value: "\"\(item)\" and categorie_de_produit like \"\(category)\"")
        default: break
        }

        if let queryItem = additionalQueryItem {
            queryItems.append(queryItem)
        }

        urlComponents.queryItems = queryItems
        guard let updatedUrl = urlComponents.url else { return url }
        return updatedUrl
    }

    var method: RequestMethod {
        switch self {
        case .allProduct, .whereCategoryIs, .whereItemInAllCategoryIs, .whereItemInOneCategoryIs:
            return .get
        }
    }
}
