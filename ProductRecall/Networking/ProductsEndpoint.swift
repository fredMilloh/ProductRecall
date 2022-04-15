//
//  ProductsEndpoint.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import Foundation

enum ProductsEndpoint: Equatable {
    case nothing
    case allProduct
    case whereCategoryIs(category: String)
    case whereItemInAllCategoryIs(item: String)
    case whereItemInOneCategoryIs(item: String, category: String)
}

extension ProductsEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .allProduct, .whereCategoryIs, .whereItemInAllCategoryIs, .whereItemInOneCategoryIs:
            return "catalog/datasets/rappelconso0/records?"
        case .nothing: return ""
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
        switch self {
        case .nothing:
            urlComponents.queryItems = []
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
            
        case .allProduct:
            urlComponents.queryItems = queryItems
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
            
        case .whereCategoryIs(let category):
            let queryItem = [
                URLQueryItem(name: "where", value: "categorie_de_produit = \"\(category)\""),
            ]
            queryItems.append(contentsOf: queryItem)
            urlComponents.queryItems = queryItems
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
            
        case .whereItemInAllCategoryIs(let item):
            let queryItem = [
                URLQueryItem(name: "where", value: "\"\(item)\""),
            ]
            queryItems.append(contentsOf: queryItem)
            urlComponents.queryItems = queryItems
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
            
        case .whereItemInOneCategoryIs(let item, let category):
            let queryItem = [
                URLQueryItem(name: "where", value: "\"\(item)\" and categorie_de_produit like \"\(category)\""),
            ]
            queryItems.append(contentsOf: queryItem)
            urlComponents.queryItems = queryItems
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
        }
    }

    var method: RequestMethod {
        switch self {
        case .nothing, .allProduct, .whereCategoryIs, .whereItemInAllCategoryIs, .whereItemInOneCategoryIs:
            return .get
        }
    }
}


