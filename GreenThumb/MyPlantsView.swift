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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    searchSection
                    Text("My Plants")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding(.bottom, 40)
                    myPlantsGridSection
                    Spacer()
                }
            }
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
    
    private var myPlantsGridSection: some View {
        LazyVGrid(columns: [GridItem(.flexible(), spacing: -10), GridItem(.flexible(), spacing: -10)], spacing: 20) {
            ForEach(filteredPlants) { plant in
                if plant.isWatered {
                    NavigationLink(destination: DetailOwnPlantView(plant: plant)) {
                        PlantCardV2(plant: plant)
                            .frame(maxWidth: .infinity)
                    }
                } else {
                    NavigationLink(destination: DetailOwnPlantView(plant: plant)) {
                        PlantCardBasah(plant: plant)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .padding([.bottom], 20)
    }
    
    
    var filteredPlants: [Plant] {
        modelData.plants.filter { $0.isOnList }
    }
}

#Preview {
    MyPlantsView().environment(ModelData())
}
