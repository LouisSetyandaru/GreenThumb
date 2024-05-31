//
//  DetailViewMac.swift
//  MacOS_GreenThumb
//
//  Created by Michael Sin on 23/05/24.
//

import SwiftUI

struct DetailViewMac: View {
    
    var plant: Plant
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
                                
                                Spacer().frame(height: 50)
                                
                                HStack {
                                    Text("Age")
                                        .font(.system(size: 17))
                                        .fontWeight(.thin)
                                        .padding(.trailing, 52)
                                        .foregroundColor(.black)
                                    
                                    Text("\(plant.age)")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 120)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                }
                                
                                Spacer().frame(height: 20)
                                
                                HStack {
                                    
                                    Text("Type")
                                        .font(.system(size: 17))
                                        .fontWeight(.thin)
                                        .padding(.trailing, 47)
                                        .foregroundColor(.black)
                                    
                                    
                                    
                                    Text("\(plant.plant_type)")
                                        .font(.system(size: 17))
                                        .padding(.trailing, 100)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                    
                                    
                                }
                                
                                Spacer().frame(height: 20)
                                
                                HStack {
                                    
                                    Text("Habitat")
                                        .font(.system(size: 17))
                                        .fontWeight(.thin)
                                        .padding(.trailing, 30)
                                        .foregroundColor(.black)
                                    
                                    Text("\(plant.habitat)")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.2, green: 0.5, blue: 0.3))
                                    
                                    
                                }
                                
                                Spacer()
                                
                                HStack {
                                    Text(plant.name)
                                        .font(.system(size: 35))
                                        .fontWeight(.bold)
                                        .padding(.bottom, 2)
                                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                                    
                                    Text(" / ")
                                        .font(.system(size: 35))
                                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                                    
                                    Text(plant.latin_name)
                                        .font(.system(size: 35))
                                        .fontWeight(.light)
                                        .italic()
                                        .padding(.bottom, 2)
                                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                                }
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
                
                Spacer().frame(height: 30)
                
                
                Text("Description")
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                    .padding(.trailing, 760)
                    .padding(.bottom, 20)
                
                Text(plant.description)
                    .font(.system(size: 20))
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                    .frame(maxWidth: 600.0)
                    .padding(.trailing, 310)
                    .padding(.bottom, 40)
                
                Text("How to Plant")
                    .font(.system(size: 25))
                    .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                    .padding(.trailing, 748)
                    .padding(.bottom, 20)
                
                Text(formatPlantingSteps(plant.plantingSteps))
                    .font(.system(size: 20))
                    .fontWeight(.thin)
                    .foregroundColor(.black)
                    .padding(.trailing, 520)
                
                Spacer().frame(height: 40)
                
                HStack {
                    
                    Spacer().frame(width: 700)
                    NavigationLink(destination: HomeViewMac()) {
                        Text("Plant This")
                            .padding()
                            .padding(.horizontal, 50.0)
                            .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                }
                .padding(.leading, 30)
                
                Spacer().frame(height: 60)
                
                
                
            }
            .background(Color(red: 249/255, green: 249/255, blue: 249/255))
            .frame(minWidth: 1080, minHeight: 720)
            .padding()
            
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
    
    return Group {
        DetailViewMac(plant: plants[6])
        
    }
    
}
