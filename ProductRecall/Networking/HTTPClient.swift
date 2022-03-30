//
//  HTTPClient.swift
//  ProductRecall
//
//  Created by fred on 21/03/2022.
//

import Foundation
import Combine

class HTTPClient : ObservableObject {
    
    @Published var productsRecall = [Record]()
    @Published var endOfList = false
    
    var pageStatus = PageStatus.ready(nextOffset: 0)
    var cancellable : Set<AnyCancellable> = Set()
    
    init() {
        get()
    }
    
    var endPoint: Endpoint = ProductsEndpoint.whereCategoryIs(search: "Alimentation")
    
    /// This method decides when to trigger the next API request while the user is scrolling.
    /// It is called during `onAppear` on the rows of the list
    func shouldLoadMore(recordItem : Record) -> Bool {
        if let lastId = productsRecall.last?.id {
            return recordItem.id == lastId ? true : false
        }
        return false
    }
    
    func get() {
        guard case let .ready(offset) = pageStatus else {
            return
        }
        /// Pending a result, the status is loading
        pageStatus = .loading(offset: offset)
        
        guard let url = URL(string: endPoint.baseURL + endPoint.path) else { return }
        var request = URLRequest(url: endPoint.addURLQueryParameters(toUrl: url, offset: offset))
        request.httpMethod = endPoint.method.rawValue
  
        URLSession.shared.dataTaskPublisher(for: request)
            
            .tryMap { output in
                guard let _ = output.response as? HTTPURLResponse else {
                    throw RequestError.noResponse
                }
                return output.data
            }
            .decode(type: Product.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("completed")
                    break
                case .failure(let error):
                    print(error)
                    self.endOfList = true
                    self.pageStatus = .done
                }
        }) { product in
            if product.totalCount == 0 {
                self.pageStatus = .done
            } else {
                guard let totalCount = product.totalCount else { return }
                let remainingOccurences = totalCount - self.productsRecall.count
                self.pageStatus = remainingOccurences > 100 ?
                    .ready(nextOffset: offset + 100) :
                    .ready(nextOffset: offset + remainingOccurences)
                self.productsRecall.append(contentsOf: product.records)
            }
        }
        .store(in: &cancellable)
    }
}

/// allows to monitor the status of network requests
enum PageStatus {
    case ready (nextOffset: Int)
    case loading (offset: Int)
    case done
}
