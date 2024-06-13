//
//  AddedPlantViewMac.swift
//  MacOS_GreenThumb
//
//  Created by Michael Sin on 02/06/24.
//

import SwiftUI

struct AddedPlantViewMac: View {
    
    var plant: Plant
    
    var body: some View {
            
            NavigationStack {
                VStack(alignment: .center) {
                    
                    Spacer().frame(height: 270)
                    
                    Image("addedplant")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 250)
                        .padding(.bottom, 30)
                    
                    Text("\(plant.name) has been added successfully! Remember to care for it—plants bring life to your home! 🌱")
                        .font(.headline)
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 6)
                        .padding(.bottom, 70)
                        .frame(maxWidth: 350.0, alignment: .center)
                        .multilineTextAlignment(.center)
                    
         
                    
                    NavigationLink(destination: HomeViewMac().environment(ModelData())) {
                      
                        Text("Back to Home")
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
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.white)
            
        }
}

#Preview {
    let plants = ModelData().plants
    return Group {
        AddedPlantViewMac(plant: plants[7])
    }
}
