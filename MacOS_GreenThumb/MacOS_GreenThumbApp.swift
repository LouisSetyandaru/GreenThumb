//
//  MacOS_GreenThumbApp.swift
//  MacOS_GreenThumb
//
//  Created by Michael Sin on 07/06/24.
//

import SwiftUI

@main
struct MacOS_GreenThumb_Watch_AppApp: App {
    
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
