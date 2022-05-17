//
//  CategoriesView.swift
//  ProductRecall
//
//  Created by fred on 06/04/2022.
//

import SwiftUI

struct CategoriesView: View {

    /// Binding captures the information needed to update the view
    @Binding var selectCategory: Category

    /// Source of truth to tab position
    @State var currentTab = 1

    /// Reference to the display mode of the screen
    @Environment(\.colorScheme) var scheme

    var body: some View {
        ScrollViewReader { proxy in

            ScrollView(.horizontal, showsIndicators: false) {

                HStack(spacing: 10) {
                    ForEach(Category.categories) { category in

                        VStack {
                            Button {
                                currentTab = category.id
                                selectCategory = category
                            } label: {
                                VStack {
                                    Image(category.icon)
                                        .resizable()
                                        .renderingMode(.original)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 25, height: 25)
                                    Text(category.name)
                                        .foregroundColor(
                                            currentTab == category.id ? .primary : .secondary
                                        )
                                        .font(.caption2)
                                        .allowsTightening(true)
                                }
                            }
                            .frame(width: 70, height: 45, alignment: .center)

                            if currentTab == category.id {
                                Capsule()
                                    .fill(.primary)
                                    .frame(height: 3)
                                    .padding(.horizontal, 5)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(width: 80, height: 60)
                    }
                }
                .padding(.horizontal, 30)
            }
            .onAppear {
                currentTab = selectCategory.id
                proxy.scrollTo(selectCategory.id, anchor: .center)
            }
            .onChange(of: selectCategory.name) { _ in
                currentTab = selectCategory.id
                proxy.scrollTo(selectCategory.id, anchor: .center)
            }
        }
        .padding(.top)
        .background(scheme == .dark ? Color.black : Color.white)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(selectCategory: .constant(Category.categories[0])).previewLayout(.sizeThatFits)
    }
}
