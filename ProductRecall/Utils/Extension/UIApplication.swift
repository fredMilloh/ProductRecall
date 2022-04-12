//
//  UIApplication.swift
//  ProductRecall
//
//  Created by fred on 12/04/2022.
//

import SwiftUI

extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
