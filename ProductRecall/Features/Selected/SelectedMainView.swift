//
//  SelectedMainView.swift
//  ProductRecall
//
//  Created by fred on 15/04/2022.
//

import SwiftUI

struct SelectedMainView: View {

    var body: some View {
        SelectedListView(persistence: PersistenceManager.shared)
    }
}

struct SelectedRecord_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMainView()
    }
}
