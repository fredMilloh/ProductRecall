//
//  SearchViewModel.swift
//  ProductRecall
//
//  Created by fred on 23/03/2022.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @ObservedObject var recordsFeed = HTTPClient()
    
    @Published var isSearchEnabled = false
    @Published var searchText: String = "" {
        didSet { isSearchEnabled = searchText.count > 2 }
    }
}
