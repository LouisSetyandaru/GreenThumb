//
//  HomeView.swift
//  GreenThumb
//
//  Created by STVN on 16/05/24.
//

import SwiftUI

struct DetailPlantViewWatch: View {
    var plant: Plant
    
    
    var body: some View {
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
                        
                    Button(action: {}) { // Empty action closure
                                Text("Done")
                                    .foregroundColor(.white)
                                    .padding(5)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                }
                
                
                
                //
                
            }
        }.background(Color(red: 0.38627450980392155, green: 0.7215686274509804, blue: 0.5254901960784314))
           
    }
}

    #Preview {
        let plants = ModelData().plants
        
        return Group {
            DetailPlantViewWatch(plant: plants[6])
        }
    }
