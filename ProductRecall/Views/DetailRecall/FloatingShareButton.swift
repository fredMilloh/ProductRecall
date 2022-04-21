//
//  FloatingShareButton.swift
//  ProductRecall
//
//  Created by fred on 21/04/2022.
//

import SwiftUI

struct FloatingShareButton: View {
    
    @ObservedObject var recall: RecallViewModel
    @State var items: [Any] = []
    @State var showView = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    items.removeAll()
                    guard let url = recall.flyerImageLink else { return }
                    items.append(url)
                    showView.toggle()
                    print("share action")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                }
                .padding(15)
                .foregroundColor(Color.white)
                .background(Color.blue.opacity(0.6))
                .cornerRadius(.infinity)
                .shadow(color: .gray, radius: 3, x: 3, y: 3)
                .shareSheet(isPresented: $showView, items: items)
            }
            .padding(.trailing, 20)
        }
        .padding(.bottom, 30)
    }
}

struct FloatingShareButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingShareButton(recall: RecallViewModel.example)
    }
}
