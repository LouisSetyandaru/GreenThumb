//
//  ContentView.swift
//  MacOS_GreenThumb
//
//  Created by MacBook Pro on 11/05/24.
//


import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home

    enum Tab {
        case home
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            HomeViewMac()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

           
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
