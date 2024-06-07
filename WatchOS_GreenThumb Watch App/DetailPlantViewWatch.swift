//
//  HomeView.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct DetailPlantViewWatch: View {
    
    @Environment(ModelData.self) var modelData
    
    var plant: Plant
    var plantIndex: Int {
            modelData.plants.firstIndex(where: { $0.id == plant.id })!
        }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        NavigationView() {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack{
                        Circle()
                                       .foregroundColor(.white)
                                       .frame(width: 90, height: 90)
                                       .padding(5)
                        CircleImage(image: Image(plant.image))
                            .frame(width: 90.0, height: 90.0)
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(100)
                            
                    }
                    Text("Time to water \n\(plant.name)")

                        .font(.headline)
                        .foregroundColor(.primary)
                        .frame(width: 120.0, height: 50.0)
                        
                    PlantThisButtonWatch(isSet: $modelData.plants[plantIndex].isWatered)
                }
                
                
                
                //
                
            }
        }.background(Color(red: 0.38627450980392155, green: 0.7215686274509804, blue: 0.5254901960784314))
           
    }
}

    #Preview {
        let plants = ModelData().plants
        
        return DetailPlantViewWatch(plant: plants[6])
            .environment(ModelData())
    }
