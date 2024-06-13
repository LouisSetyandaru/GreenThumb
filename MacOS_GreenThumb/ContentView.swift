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
        
            HomeViewMac()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
                .frame(maxWidth: 1445)

           
        
        .background(Color(red: 249/255, green: 249/255, blue: 249/255))
        
    }
}

#Preview {
    ContentView().environment(ModelData())
}
