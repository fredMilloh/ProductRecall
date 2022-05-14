//
//  AppNavigationView.swift
//  ProductRecall
//
//  Created by fred on 08/04/2022.
//

import SwiftUI

struct NavigationTabView: View {

    enum Tab {
        case recalls
        case retained
    }

    /// Source of truth to selection tab
    @State private var selection: Tab = .recalls
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
            .tag(Tab.recalls)
            .navigationViewStyle(StackNavigationViewStyle())

            NavigationView {
                SelectedMainView()
            }
            .tabItem {
                Label {
                    Text("Retenus")
                } icon: {
                    Image(systemName: "tray.and.arrow.down")
                }
            }
            .tag(Tab.retained)
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct NavigationTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabView()
    }
}
