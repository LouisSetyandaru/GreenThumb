//
//  HomeViewMac.swift
//  MacOS_GreenThumb
//
//  Created by STVN on 22/05/24.
//

import SwiftUI

struct HomeViewMac: View {
    
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        VStack {
            // Top bar
            HStack {
                // Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: .constant(""))
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 30)
                }
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(15)
                
                Spacer()
                
                // Home button
                Button(action: {
                    // Action for the home button
                }) {
                    Text("Home")
                        .foregroundColor(.white)
                        .frame(width: 80, height: 40)
                        .background(Color(red: 199/255, green: 219/255, blue: 199/255))
                        .cornerRadius(15)
                }.cornerRadius(15)
                
                // Profile button
                Button(action: {
                    // Action for the profile button
                }) {
                    Text("Profile")
                        .foregroundColor(.white)
                        .frame(width: 80, height: 40)
                        .background(Color(red: 199/255, green: 219/255, blue: 199/255))
                        .cornerRadius(15)
                }.cornerRadius(15)
                
                // Notification button
                Button(action: {
                    // Action for the notification button
                }) {
                    Image(systemName: "bell.fill")
                        .foregroundColor(Color(red: 199/255, green: 219/255, blue: 199/255))
                        .frame(width: 40, height: 40)
                }.cornerRadius(15)
            }
            .padding()
            
            // ScrollView for plant cards
            ScrollView {
                VStack {
                    ForEach(modelData.plants) { plant in
                        PlantCardMacOS(plant: plant)
                    }
                }
            }
        }
        .padding()
        .background(Color(red: 249/255, green: 249/255, blue: 249/255))
        .frame(minWidth: 1080, minHeight: 720)
    }
}

#Preview {
    HomeViewMac().environment(ModelData())
}
