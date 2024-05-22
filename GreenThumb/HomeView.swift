//
//  HomeView.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct HomeView: View {
    @Environment(ModelData.self) var modelData
    @State private var searchText = ""
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
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        TextField("Search", text: $searchText)
                            .padding(.leading, 40.0)
                            .frame(height: 40)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .overlay(
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                    Spacer()
                                }
                                    .padding(.horizontal,11.0)
                                    .foregroundColor(.gray)
                            )
                        
                        Button(action: {
                            // Notification action
                        }) {
                            Image(systemName: "bell")
                                .padding()
                        }
                    }
                    .padding()
                    
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
                    .padding([.bottom, .trailing])
                    .padding(.leading, 25.0)
                    
                    Text("Featured Plants")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(modelData.plants.filter { $0.isFeatured }) { plant in
                                NavigationLink(destination: DetailPlantView(plant: plant)) {
                                    PlantCard(plant: plant)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Text("All Plants")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(filteredPlants) { plant in
                        NavigationLink(destination: DetailPlantView(plant: plant)) {
                            PlantCardV2(plant: plant)
                        }
                    }
                    .padding(.leading, 20.0)
                    .padding(.bottom, 9)
                    
                    Spacer()
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView().environment(ModelData())
}
