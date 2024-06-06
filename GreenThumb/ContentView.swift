//
//  ContentView.swift
//  GreenThumb
//
//  Created by MacBook Pro on 10/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    @State private var isLoading = true
    @State private var showLoadingView = true

    enum Tab {
        case home
        case list
    }

    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)

                MyPlantsView()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                    .tag(Tab.list)
            }

            if showLoadingView {
                LoadingView()
                    .opacity(isLoading ? 1 : 0)
                    .animation(.easeOut(duration: 1), value: isLoading)
            }
        }
        .onAppear {
            simulateLoading()
        }
    }

    func simulateLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                isLoading = false
            }
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showLoadingView = false
            }
        }
    }
}

#Preview {
    ContentView().environment(ModelData())
}
