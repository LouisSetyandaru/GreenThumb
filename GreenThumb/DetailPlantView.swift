//
//  DetailPlantView.swift
//  GreenThumb
//
//  Created by Michael Sin on 17/05/24.
//

import SwiftUI

struct DetailPlantView: View {
    
    var plant: Plant
    
    var body: some View {
        ScrollView {
            ZStack {
                
                CircleImage(image: Image("ic_back"))
                .frame(width: 30, height: 30)
                .offset(x: -150, y: -200)
                
                VStack {
                    
                    Spacer().frame(height: 80)
                    
                    HStack {
                        
                        ZStack {
                            
                            Circle()
                                .fill(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.11))
                                .frame(width: 300.0, height: 300.0)
                                .offset(x: -70, y: -200)
                            
                            // Plant Image
                            CircleImage(image: Image(plant.image))
                                .frame(width: 100, height: 400)
                                .padding(.leading)
                                .padding(.trailing, 110.0)
                                .offset(x: -30)
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Age")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .padding(.bottom, 10.0)
                            
                            Text("\(plant.age)")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                .padding(.bottom, 20.0)
                            
                            Text("Watering Time")
                                .font(.callout)
                                .foregroundColor(.gray)
                                .padding(.bottom, 10.0)
                            
                            Text("\(plant.wateringTime)")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                .padding(.bottom, 20.0)
                        }
                    }
                }
                .frame(width: 400.0, height: 500.0)
                .background(Color(.systemGreen).opacity(0.1))
                
                
                VStack {
                    Spacer().frame(height: 750)
                    ZStack {
                        VStack {
                            
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
                            
                            Text(plant.plantingSteps)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding(.bottom, 20.0)
                                .padding(.horizontal, 6)
                                .frame(maxWidth: 350.0, alignment: .leading)
                            
                            Text("Plant This")
                                .padding()
                                .padding(.horizontal, 120.0)
                                .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                            
                            Spacer().frame(height: 75)
                        }
                        .frame(width: 400.0, height: 400.0)
                        .background(Color.white)
                        .cornerRadius(50)
                    }
                    
                }
            }
            .frame(width: 400.0, height: 400.0)
        }
        
    }
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        DetailPlantView(plant: plants[6])
    }
}
