//
//  PlantCardV2.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct PlantCardV2: View {
    var plant: Plant
    var body: some View {
        VStack(alignment: .center) {
            
          
            HStack {
                
                ZStack {
                    // Background Circle
                    Circle()
                        .fill(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.11))
                        .frame(width: 90.0, height: 90.0)
                        .offset(x: -37, y: -200)
                    
                    // Plant Image
                    CircleImage(image: Image(plant.image))
                    .frame(width:70, height: 420)
                    .padding(.leading)
                    .offset(x: 37, y: 40)
                }
                
                VStack(alignment: .leading) {
                    
                    Text(plant.name)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.leading, 5.0)
                        .padding(.top)
                    
                    Text(plant.latin_name)
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(.leading, 5.0)
                        .padding([.bottom, .trailing])
                        
                }
                .frame(width: 180)
                .background(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.7))
                .offset(x: -50, y: 140)
                
            }
            .frame(width: 150.0, height: 350.0)

            
        }
        .background(Color(.systemGreen).opacity(0.1))
        .frame(width: 150.0, height: 350.0)
        .cornerRadius(15)
    }
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        PlantCardV2(plant: plants[6])

    }
    

}
