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
                                .offset(x: -30, y: -200)
                            
                            CircleImage(image: Image(plant.image))
                                .frame(width: 10, height: 400)
                                .padding(.leading, 20) // Reduced padding
                                .padding(.trailing, 20)
                                .offset(x: -30)
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text("Age")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding(.bottom, 10.0)
                            
                            Text("\(plant.age)")
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
                        .frame(width: 100.0)
                        
                        Spacer().frame(width: 50)
                        
                    }
                    .frame(width: 400.0, height: 500.0)
                }
                .frame(width: 400.0, height: 500.0)
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
                            
                            Text("Plant This")
                                .padding()
                                .padding(.horizontal, 120.0)
                                .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                            
                            Spacer().frame(height: 30)
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

func formatPlantingSteps(_ steps: String) -> String {
    let stepsArray = steps.split(separator: " ")
    var formattedSteps = ""
    
    for (index, step) in stepsArray.enumerated() {
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
    
    return Group {
        DetailPlantView(plant: plants[6])
    }
}
