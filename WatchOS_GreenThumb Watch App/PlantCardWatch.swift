//
//  PlantCard.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct PlantCardWatch: View {
    var plant: Plant
    var body: some View {
        VStack(alignment: .center) {
            
            HStack(alignment: .center) {
                Text(plant.name)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                    .padding(.top, 40.0)
                    
                
                
                CircleImage(image: Image(plant.image))
                    .frame(width: 1,height: 1)
            }
            .frame(width: 1, height: 1)
            .background(Color(red: 0.286, green: 0.522, blue: 0.325).opacity(0.11))
            .cornerRadius(15)

              
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(plant.description)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20.0)
                        .padding(.horizontal, 6)
                        
                }
                
            }
            .frame(width: 1, height: 1)

            
        }
        .background(Color(red: 0.286, green: 0.522, blue: 0.325).opacity(0.1))

        .frame(width: 1, height: 1)
        .cornerRadius(15)
    }
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        PlantCardWatch(plant: plants[1])

    }
}



