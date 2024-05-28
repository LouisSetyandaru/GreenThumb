//
//  HomeView.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct HomeViewWatch: View {
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
                HStack() {
                  
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(modelData.plants.filter { $0.isFeatured }) { plant in
                                NavigationLink(destination: DetailPlantView(plant: plant)) {
                                    PlantCardWatch(plant: plant)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    Text("All Plants")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
//                    ForEach(filteredPlants) { plant in
//                        NavigationLink(destination: DetailPlantView(plant: plant)) {
//                            PlantCardV2(plant: plant)
//                        }
//                    }
//                    .padding(.leading, 20.0)
//                    .padding(.bottom, 9)
//                    
//                    Spacer()
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeViewWatch().environment(ModelData())
}
