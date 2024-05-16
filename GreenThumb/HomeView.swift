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
        switch selectedFilter {
        case .all:
            return modelData.plants
        case .outdoors:
            return modelData.plants.filter { $0.isOutdoor }
        case .indoors:
            return modelData.plants.filter { !$0.isOutdoor }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.leading, 24)
                    .frame(height: 40)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Spacer()
                        }
                        .padding(.horizontal, 8)
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
            
            HStack {
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
                .padding()
                
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
            .padding(.horizontal)
            
            Text("Featured Plants")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
//                    ForEach(filteredPlants) { plant in
//                        PlantCard(plant: plant)
//                            .frame(width: 200)
//                            .padding(.leading)
//                    }
                    
                    PlantCard()
                    
                    PlantCard()
                    
                    PlantCard()
                }
                .padding()
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView().environment(ModelData())
}
