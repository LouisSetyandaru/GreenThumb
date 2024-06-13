//
//  PlantCardMacOS.swift
//  MacOS_GreenThumb
//
//  Created by STVN on 22/05/24.
//

import SwiftUI

struct PlantCardMacOS: View {
    
    var plant: Plant
    var body: some View {
        HStack(alignment: .center) {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 15)
                               .fill(Color(red: 233/255, green: 243/255, blue: 237/255))
                               .overlay(
                                   RoundedRectangle(cornerRadius: 120)
                                    .foregroundColor(Color(red: 215/255, green: 234/255, blue: 211/255))
                               )
                               .offset(x: -98, y: -104)
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(plant.name)
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.bottom, 2)
                            .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                        
                        Text(plant.description)
                            .font(.title3)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                   
                }
                .padding()
                

                
            }
            .padding()
            
            
           
            
            CircleImage(image: Image(plant.image))
                .frame(width: 320.0, height: 320.0)

        }
        .background(Color(red: 233/255, green: 243/255, blue: 237/255))
        .cornerRadius(10)
        .frame(minWidth: 900, minHeight: 300)
        .frame(maxWidth: 950, maxHeight: 320)
        .padding()


    }
    
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        PlantCardMacOS(plant: plants[6])

    }
    
}
