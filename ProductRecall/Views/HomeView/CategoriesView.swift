//
//  CategoriesView.swift
//  ProductRecall
//
//  Created by fred on 06/04/2022.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var currentTab = ""
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollViewReader { proxy in
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 10) {
                    ForEach(categories) { category in
                        
                        VStack {
                            Image(category.icon)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 25, height: 25)
                            Text(category.name)
                                .foregroundColor(currentTab == category.id ? .black : .gray)
                                .font(.caption2)
                            
                            /// line indicating the selected category
                            if currentTab == category.id {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                                    .frame(height: 3)
                                    .padding(.horizontal, 5)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal)
                            }
                        }
                        .frame(width: 80, height: 60, alignment: .top)
                        .onTapGesture {
                            withAnimation(.easeInOut){
                                currentTab = category.id
                                viewModel.selectedCategory = category.description
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
        .padding(.top)
        .background(scheme == .dark ? Color.black : Color.white)
        .overlay(
            Divider()
                .padding(.horizontal, -10)
            ,alignment: .bottom
        )
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: HomeViewModel()).previewLayout(.sizeThatFits)
    }
}
