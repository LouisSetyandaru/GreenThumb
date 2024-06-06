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
        modelData.plants.filter { $0.isWatered }
    }

    
    var body: some View {
        NavigationView() {
     
              
                  
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(modelData.plants.filter { $0.isWatered }) { plant in
                                NavigationLink(destination: DetailPlantViewWatch(plant: plant)) {
                                    PlantCardWatch(plant: plant)
                                }
                            }
                        }
                        .padding(30)
                    }
                    
                   
                    
//                    ForEach(filteredPlants) { plant in
//                        NavigationLink(destination: DetailPlantView(plant: plant)) {
//                            PlantCardV2(plant: plant)
//                        }
//                    }
//                    .padding(.leading, 20.0)
//                    .padding(.bottom, 9)
//
//                    Spacer()
                
            
           
        }.background(Color(red: 0.38627450980392155, green: 0.7215686274509804, blue: 0.5254901960784314))
    }
}

#Preview {
    HomeViewWatch().environment(ModelData())
}
