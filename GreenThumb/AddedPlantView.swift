//
//  AddedPlantView.swift
//  GreenThumb
//
//  Created by Michael Sin on 01/06/24.
//

import SwiftUI

struct AddedPlantView: View {
    
    var plant: Plant
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    
                    Spacer().frame(height: 100)
                    
                    Image("addedplant")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 250)
                    
                    Text("\(plant.name) has been added successfully! Remember to care for it—plants bring life to your home! 🌱")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 6)
                        .padding(.bottom, 50)
                        .frame(maxWidth: 350.0, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    NavigationLink(destination: StepToPlant(plant: plant).environment(ModelData())) {
                      
                        Text("Go to Step")
                            .padding(.vertical, 15.0)
                            .padding(.horizontal, 80.0)
                            .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        }
        
}

#Preview {
    let plants = ModelData().plants
    return Group {
        AddedPlantView(plant: plants[7])
    }
}
