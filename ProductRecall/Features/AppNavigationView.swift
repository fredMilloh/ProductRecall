//
//  AppNavigationView.swift
//  ProductRecall
//
//  Created by fred on 08/04/2022.
//

import SwiftUI

struct AppNavigationView: View {
    
    enum Tab {
        case rappels
        case retenus
    }
    
    @State private var selection: Tab = .rappels
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label {
                    Text("Rappels")
                } icon: {
                    Image(systemName: "list.bullet")
                        .foregroundColor(.blue)
                }
            }
            .tag(Tab.rappels)
            .navigationViewStyle(StackNavigationViewStyle())
            
            NavigationView {
                SelectedRecord()
            }
            .tabItem {
                Label {
                    Text("Retenus")
                } icon: {
                    Image(systemName: "tray.and.arrow.down")
                }
            }
            .tag(Tab.retenus)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct AppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationView()
    }
}
