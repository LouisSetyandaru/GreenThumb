//
//  DetailOwnViewMac.swift
//  MacOS_GreenThumb
//
//  Created by Michael Sin on 06/06/24.
//

import SwiftUI

struct DetailOwnViewMac: View {
    
    var plant: Plant
    
    @State private var wateringCount: Int
    
    init(plant: Plant) {
        self.plant = plant
        _wateringCount = State(initialValue: plant.wateringCount)
    }
    
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
                
                HStack {
                    
                    Text("Watered Count")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                        .padding(.bottom, 10)
                        .padding(.trailing, 15)
                    
                    Text("\(wateringCount)")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                        .offset(y: -3)
                    
       
                    
                    Text("Watered Time")
                        .font(.system(size: 25))
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                        .padding(.bottom, 10)
                        .padding(.leading, 85)
                        .padding(.trailing, 15)
                    
        
                    
                    Text("\(plant.wateringTime)")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                        .offset(y: -3)
                }
                .padding(.trailing, 350)
                
                Spacer().frame(height: 40)
                
                HStack {
                    
                    Text("Apply 100ml of water per watering session.")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 73/255, green: 133/255, blue: 83/255))
                   
                        .padding(.trailing, 220)
                        .padding(.bottom, 40)
                        .offset(y: 15)
                    
                    Button(action: {
                        
                        wateringCount += 1
                        
                    }) {
                        Text("Done Watering")
                            .font(.system(size: 15))
                            .padding()
                            .padding(.horizontal, 60.0)
                            .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                            .foregroundColor(Color.white)
                            .cornerRadius(20)
                    }
                    
                    
                }
            }
            .background(Color(red: 249/255, green: 249/255, blue: 249/255))
            .frame(minWidth: 1080, minHeight: 720)
            .padding()
            
        }
    }
}


#Preview {
    let plants = ModelData().plants
    return  DetailOwnViewMac(plant: plants[6])
        .environment(ModelData())
}
