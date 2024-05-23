//
//  PlantCardV2.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct PlantCardBasah: View {
    var plant: Plant
    var body: some View {
        VStack(alignment: .center) {
            
          
            HStack {
                
                ZStack {
                    // Background Circle
                    Circle()
                        .fill(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.11))
                        .frame(width: 90.0, height: 90.0)
                        .offset(x: -22, y: -37)
                    
                    // Plant Image
                    CircleImage(image: Image(plant.image))
                    .frame(width: 90, height: 130)
                    .padding(.leading)
                }
                
                
                VStack(alignment: .leading) {
                    Text(plant.name)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                        .padding(.leading, 15.0)
                        .padding(.top)
                    
                    Text(plant.description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding([.leading, .bottom, .trailing])
                        
                }
                ZStack {
                    // Background Circle
                    Circle()
                        .fill(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.11))
                        .frame(width: 90.0, height: 90.0)
                        .offset(x: 12, y: -27)
                    
                    // Plant Image
                    CircleImage(image: Image("water-drop-icon"))
                    .frame(width: 30, height: 40)
                    .offset(x: 10, y: -27)
               
                }
            }
            .frame(width: 350.0, height: 130.0)

            
        }
        .background(Color(.systemGreen).opacity(0.1))
        .frame(width: 350.0, height: 130.0)
        .cornerRadius(15)
    }
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        PlantCardBasah(plant: plants[6])

    }
    

}
