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
    
    var body: some View {
        NavigationStack  {
            ScrollView {
                VStack(alignment: .leading) {
                    searchSection
                    filterButtonsSection
                    featuredPlantsSection
                    allPlantsSection
                    Spacer()
                }
            }
            .navigationTitle("Home")
            
        }
    }
    
    private var searchSection: some View {
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
    }
    
    private var filterButtonsSection: some View {
        HStack(alignment: .center) {
            filterButton(filterType: .all, text: "All")
            filterButton(filterType: .outdoors, text: "Outdoors")
            filterButton(filterType: .indoors, text: "Indoors")
        }
        .padding([.bottom, .trailing])
        .padding(.leading, 25.0)
    }
    
    private func filterButton(filterType: FilterType, text: String) -> some View {
        Button(action: {
            selectedFilter = filterType
        }) {
            Text(text)
                .padding()
                .padding(.horizontal, 10.0)
                .background(selectedFilter == filterType ? Color(red: 73/255, green: 133/255, blue: 83/255) : Color.clear)
                .foregroundColor(selectedFilter == filterType ? Color.white : Color.black)
                .cornerRadius(8)
        }
    }
    
    private var featuredPlantsSection: some View {
        VStack(alignment: .leading) {
            Text("Featured Plants")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(modelData.plants.filter { $0.isFeatured }) { plant in
                        NavigationLink(destination: DetailPlantView(plant: plant)) {
                            PlantCardV2(plant: plant)
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private var allPlantsSection: some View {
        VStack(alignment: .leading) {
            Text("Plants List")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.vertical, 20)
            
            LazyVGrid(columns: [GridItem(.flexible(), spacing: -10), GridItem(.flexible(), spacing: -10)], spacing: 20) {
                ForEach(filteredPlants) { plant in
                    if plant.isOnList {
                        NavigationLink(destination: DetailOwnPlantView(plant: plant)) {
                            PlantCardV2(plant: plant)
                                .frame(maxWidth: .infinity)
                        }
                    } else {
                        NavigationLink(destination: DetailPlantView(plant: plant)) {
                            PlantCardV2(plant: plant)
                                .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding([.bottom], 20)
                .padding(.leading, 20.0)
                .padding(.bottom, 9)
            }
        }
    }
        
        
        private var filteredPlants: [Plant] {
            let filtered = modelData.plants.filter { plant in
                (selectedFilter == .all || (selectedFilter == .outdoors && plant.isOutdoor) || (selectedFilter == .indoors && !plant.isOutdoor)) &&
                (searchText.isEmpty || plant.name.lowercased().contains(searchText.lowercased()))
            }
            return filtered
        }
    }
    
    #Preview {
        HomeView().environment(ModelData())
    }
