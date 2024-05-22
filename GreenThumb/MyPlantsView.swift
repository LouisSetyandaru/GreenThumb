//
//  MyPlantsView.swift
//  GreenThumb
//
//  Created by MacBook Pro on 17/05/24.
//

import SwiftUI

struct MyPlantsView: View {
    @Environment(ModelData.self) var modelData
    @State private var searchText = ""

    
    var filteredPlants: [Plant] {
        modelData.plants.filter { $0.isOnList == true }
    }

    
    var body: some View {
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
                    
                    
                    
            
                }
                .padding([.bottom, .trailing])
                .padding(.leading, 25.0)
                
                Text("My Plants")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                
                
                
                ForEach(filteredPlants) { plant in
                    if plant.isWatered {
                        PlantCardV2(plant: plant)
                    } else {
                        PlantCardBasah(plant: plant)
                    }
                }
                .padding(.leading, 20.0)
                .padding(.bottom, 9)

                Spacer()

            }
        }
    }
}
#Preview {
    MyPlantsView().environment(ModelData())
}
