//
//  ProductsEndpoint.swift
//  ProductRecall
//
//  Created by fred on 22/03/2022.
//

import Foundation

enum ProductsEndpoint {
    case allProduct
    case whereCategoryIs(search: String)
}

extension ProductsEndpoint: Endpoint {
    
    var path: String {
        switch self {
        case .allProduct, .whereCategoryIs:
            return "catalog/datasets/rappelconso0/records?"
        }
    }
    
    func addURLQueryParameters(toUrl url: URL, offset: Int) -> URL {
        guard var urlComponents = URLComponents(
            url: url,
            resolvingAgainstBaseURL: false
        ) else { return url }
        
        var queryItems = [URLQueryItem]()
        switch self {
        case .allProduct:
            queryItems = [
                URLQueryItem(name: "order_by", value: "reference_fiche desc"),
                URLQueryItem(name: "limit", value: "100"),
                URLQueryItem(name: "offset", value: String(offset))
            ]
            urlComponents.queryItems = queryItems
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
            
        case .whereCategoryIs(let search):
            queryItems = [
                URLQueryItem(name: "where", value: "categorie_de_produit = \"\(search)\""),
                URLQueryItem(name: "order_by", value: "reference_fiche desc"),
                URLQueryItem(name: "limit", value: "100"),
                URLQueryItem(name: "offset", value: String(offset))
            ]
            urlComponents.queryItems = queryItems
            guard let updatedUrl = urlComponents.url else { return url }
            return updatedUrl
        }
    }

    var method: RequestMethod {
        switch self {
        case .allProduct, .whereCategoryIs:
            return .get
        }
    }
}
