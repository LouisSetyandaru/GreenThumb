//
//  DetailPlantView.swift
//  GreenThumb
//
//  Created by Michael Sin on 17/05/24.
//

import SwiftUI

struct DetailPlantView: View {
    
    @Environment(ModelData.self) var modelData
    
    var plant: Plant
    
    @State private var navigateStepToPlant = false
    
    var plantIndex: Int {
        modelData.plants.firstIndex(where: { $0.id == plant.id })!
    }
    
    var body: some View {
        
        @Bindable var modelData = modelData
        
        NavigationStack {
            ScrollView {
                ZStack {
                    
                    
                    VStack {
                        
                        Spacer().frame(height: 80)
                        
                        HStack {
                            
                            
                            ZStack {
                                
                                Circle()
                                    .fill(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.11))
                                    .frame(width: 300.0, height: 300.0)
                                    .offset(x: -30, y: -200)
                                
                                CircleImage(image: Image(plant.image))
                                    .frame(width: 16.0, height: 580.0)
                                    .padding(.leading, 20) // Reduced padding
                                    .padding([.bottom, .trailing], 20)
                                    .offset(x: -106,y: 0)
                            }
                            
                            VStack(alignment: .leading) {
                                
                                Text("Estimated to live up to")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10.0)
                                
                                Text("\(plant.age) Week")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                    .padding(.bottom, 20.0)
                                
                                Text("Latin name")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10.0)
                                
                                Text("\(plant.latin_name)")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                    .padding(.bottom, 20.0)
                                
                                Text("Type")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10.0)
                                
                                Text("\(plant.plant_type)")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                    .padding(.bottom, 20.0)
                                
                                Text("Habitat")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10.0)
                                
                                Text("\(plant.habitat)")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                    .padding(.bottom, 20.0)
                                
                                Spacer().frame(height: 60)
                                
                            }
                            .frame(width: 120.0)
                            
                            Spacer().frame(width: 60)
                            
                            
                        }
                        .frame(width: 400.0, height: 500.0)
                    }
                    .frame(width: 400.0, height: 600.0)
                    .background(Color(.systemGreen).opacity(0.1))
                    
                    
                    VStack {
                        Spacer().frame(height: 750)
                        ZStack {
                            VStack {
                                
                                Spacer().frame(height: 20)
                                
                                Text(plant.name)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                                
                                    .padding(.vertical, 20.0)
                                    .frame(maxWidth: 350.0, alignment: .leading)
                                
                                
                                Text(plant.description)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 6)
                                    .frame(maxWidth: 350.0, alignment: .leading)
                                
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
                                
                                
                                Spacer()
                                
                                NavigationLink(destination: AddedPlantView(plant: plant), isActive: $navigateStepToPlant) {
                                    PlantThisButton(isSet: $modelData.plants[plantIndex].isOnList, navigateStepToPlant: $navigateStepToPlant)
                                }
                                
                                
                                
                                Spacer().frame(height: 30)
                            }
                            .frame(width: 400.0, height: 400.0)
                            .background(Color.white)
                            .cornerRadius(50)
                        }
                        
                    }
                }
                .frame(width: 400.0, height: 135.0)
            }
        }
    }
}


func formatPlantingSteps(_ steps: String) -> String {
    let stepsArray = steps.split(separator: " ")
    var formattedSteps = ""
    
    for (_, step) in stepsArray.enumerated() {
        if step.hasSuffix(".") && (step.dropLast().allSatisfy { $0.isNumber }) {
            formattedSteps += "\n\(step) "
        } else {
            formattedSteps += "\(step) "
        }
    }
    
    return formattedSteps.trimmingCharacters(in: .whitespacesAndNewlines)
}

#Preview {
    let plants = ModelData().plants
    return  DetailPlantView(plant: plants[6])
        .environment(ModelData())
}
