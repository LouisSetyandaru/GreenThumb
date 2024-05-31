//
//  HomeViewMac.swift
//  MacOS_GreenThumb
//
//  Created by STVN on 22/05/24.
//

import SwiftUI

struct HomeViewMac: View {
    
    @State private var searchText = ""

    @Environment(ModelData.self) var modelData
    @State private var selectedFilter: FilterType = .all
    
    enum FilterType {
        case all, outdoors, indoors
    }
    
    var filteredPlants: [Plant] {
        let filtered = modelData.plants.filter { plant in
            (selectedFilter == .all || (selectedFilter == .outdoors && plant.isOutdoor) || (selectedFilter == .indoors && !plant.isOutdoor)) &&
            (searchText.isEmpty || plant.name.lowercased().contains(searchText.lowercased()))
        }
        return filtered
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
                
                // Featured section
                ScrollView {
                    
                    Text("Featured")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding()
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                    
                    VStack(alignment: .center) {
                        
                        HStack(spacing: 15) {
                            ForEach(modelData.plants.filter { $0.isFeatured }) { plant in
                                
                                NavigationLink(destination: DetailViewMac(plant: plant)) {
                                    PlantCard(plant: plant)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Spacer().padding()
                    
                    HStack(alignment: .center) {
                        Button(action: {
                            selectedFilter = .all
                        }) {
                            Text("All")
                                .padding()
                                .padding(.horizontal, 10.0)
                                .background(selectedFilter == .all ? Color(red: 73/255, green: 133/255, blue: 83/255) : Color.clear)
                                .foregroundColor(selectedFilter == .all ? Color.white : Color.black)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            selectedFilter = .outdoors
                        }) {
                            Text("Outdoors")
                                .padding()
                                .background(selectedFilter == .outdoors ? Color(red: 73/255, green: 133/255, blue: 83/255) : Color.clear)
                                .foregroundColor(selectedFilter == .outdoors ? Color.white : Color.black)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            selectedFilter = .indoors
                        }) {
                            Text("Indoors")
                                .padding()
                                .background(selectedFilter == .indoors ? Color(red: 73/255, green: 133/255, blue: 83/255) : Color.clear)
                                .foregroundColor(selectedFilter == .indoors ? Color.white : Color.black)
                                .cornerRadius(8)
                        }
                    }
                    
                    VStack {
                        ForEach(filteredPlants) { plant in
                            NavigationLink(destination: DetailViewMac(plant: plant)) {
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
    HomeViewMac().environment(ModelData())
}
