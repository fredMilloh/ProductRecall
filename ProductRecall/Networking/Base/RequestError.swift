//
//  RequestError.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case unauthorized
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .invalidURL:
            return "Invalid URL"
        case .unauthorized:
            return "Offline or expired session"
        default:
            return "Unknown error"
        }
    }
}
