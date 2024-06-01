//
//  StepToPlant.swift
//  GreenThumb
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI

struct StepToPlant: View {
    
//    @Environment(ModelData.self) var modelData
    
    var plant: Plant
    
//    var plantIndex: Int {
//        modelData.plants.firstIndex(where: { $0.id == plant.id })!
//    }
    
    var body: some View {
        
//        @Bindable var modelData = modelData

        NavigationView {
            ScrollView {
                VStack {
                    
                    Divider()
                    
                    Text("Step 1")
                        .font(.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    
                    Divider()
                    
                    MapView(coordinate: plant.locationCoordinate)
                        .frame(height: 300)
                    
                    Divider()
                    
                    Text("You can look for \(plant.name) seeds in the following stores:")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 6)
                        .frame(maxWidth: 350.0, alignment: .leading)
                    
                    HStack{
                        CircleImage(image:Image(plant.store_image))
                        //                        .offset(y: -130)
                            .frame(width: 90, height: 130)
                            .padding(.leading)
                            .clipShape(Circle())
                            .overlay {Circle().stroke(.white, lineWidth: 4)}
                            .shadow(radius: 7)
                        VStack{
                            Text(plant.store_name)
                                .font(.system(size: 20))
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                            
                            //                    .padding(.vertical, 20.0)
                                .frame(maxWidth: 350.0, alignment: .leading)
                            
                            Text(plant.store_address)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 6)
                                .frame(maxWidth: 350.0, alignment: .leading)
                        }
                        .padding()
                    }
                    .padding()
                    
                    Divider()
                    
                    Text("Step 2")
                        .font(.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("How to Plant")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                        
                            .padding(.vertical, 20.0)
                            .frame(maxWidth: 350.0, alignment: .leading)
                        
                        
                        Text(formatPlantingSteps(plant.plantingSteps))
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 6)
                            .frame(maxWidth: 350.0, alignment: .leading)
                    }
                    .padding()
                    
                    Divider()
                    
                    Text("Step 3")
                        .font(.title)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("How to Plant")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                        
                            .padding(.vertical, 20.0)
                            .frame(maxWidth: 350.0, alignment: .leading)
                        
                        
                        Text(formatPlantingSteps(plant.plantingSteps))
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 6)
                            .frame(maxWidth: 350.0, alignment: .leading)
                    }
                    .padding()
                    
                    
                    Spacer()
                }
            }
            .navigationTitle("Step To Plant")
    
        }
    }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        StepToPlant(plant: plants[7])
    }
}
