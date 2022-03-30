//
//  OptionalString+.swift
//  ProductRecall
//
//  Created by fred on 24/03/2022.
//

import Foundation

extension Optional where Wrapped == String {

    /// to replace ?? ""
    var orEmpty: String {
        switch self {
        case .none:
            return ""
        case .some(let wrapped):
            return wrapped
        }
    }
}
