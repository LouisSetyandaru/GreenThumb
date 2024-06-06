//
//  MyPlantsViewMac.swift
//  MacOS_GreenThumb
//
//  Created by Michael Sin on 02/06/24.
//

import SwiftUI

struct MyPlantsViewMac: View {
    
    @Environment(ModelData.self) var modelData
    @State private var searchText = ""

    
    var filteredPlants: [Plant] {
        modelData.plants.filter { $0.isOnList == true }
    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // Top bar
                HStack {
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
                    NavigationLink(destination: HomeViewMac()) {
                        Text("Home")
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
                
                ScrollView {
                    
                    Text("My Plants View")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                    
                    Spacer().padding()
                    
                    
                    VStack {
                        ForEach(filteredPlants) { plant in
                            NavigationLink(destination: DetailOwnViewMac(plant: plant)) {
                                PlantCardMacOS(plant: plant)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .background(Color(red: 249/255, green: 249/255, blue: 249/255))
                .frame(minWidth: 1080, minHeight: 720)
                .padding()
            }
        }
    }
}

#Preview {
    MyPlantsViewMac().environment(ModelData())
}
