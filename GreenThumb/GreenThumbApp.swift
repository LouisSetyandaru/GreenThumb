//
//  GreenThumbApp.swift
//  GreenThumb
//
//  Created by MacBook Pro on 10/05/24.
//

import SwiftUI

@main
struct GreenThumbApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
            
        }
    }
}
