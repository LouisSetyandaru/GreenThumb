//
//  DetailOwnPlantView.swift
//  GreenThumb
//
//  Created by MacBook Pro on 29/05/24.
//

import SwiftUI

struct DetailOwnPlantView: View {
    var plant: Plant
    
    @State private var wateringCount: Int
    @State private var showingAlert = false
    
    init(plant: Plant) {
        self.plant = plant
        _wateringCount = State(initialValue: plant.wateringCount)
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        
                        Spacer().frame(height: 80)
                        
                        HStack {
                            
                            
                            ZStack {
                                
                                Circle()
                                    .fill(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314).opacity(0.11))
                                    .frame(width: 300.0, height: 300.0)
                                    .offset(x: -30, y: -200)
                                
                                CircleImage(image: Image(plant.image))
                                    .frame(width: 16.0, height: 550.0)
                                    .padding(.leading, 20) // Reduced padding
                                    .padding([.bottom, .trailing], 20)
                                    .offset(x: -106,y: 0)
                            }
                            
                            VStack(alignment: .leading) {
                                
                                Text("Age")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10.0)
                                
                                Text("\(plant.plantingAge) Day")
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
                                    .font(.title)
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                                
                                    .padding(.vertical, 20.0)
                                    .frame(maxWidth: 350.0, alignment: .leading)
                                
                                
                                Text(plant.description)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 6)
                                    .frame(height: 60.0)
                                    .frame(maxWidth: 350.0, alignment: .leading)
                                
                                
                                
                                Divider()
                                HStack{
                                    Text("Watered Count")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                                    
                                        .padding(.vertical, 20.0)
                                    
                                    
                                    Spacer()
                                    Text("\(wateringCount)")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.286, green: 0.522, blue: 0.325))
                                        .frame(maxWidth: 40.0, alignment: .leading)
                                    
                                }
                                .frame(maxWidth: 350.0, alignment: .leading)
                                
                                
                                Text("Apply 100ml of water per watering session.")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.horizontal, 6)
                                    .frame(maxWidth: 350.0, alignment: .leading)
                                
                                Divider()
                                HStack{
                                    Text("Watered Time")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                                    
                                        .padding(.vertical, 20.0)
                                    
                                    
                                    Spacer()
                                    
                                    Text("\(plant.wateringTime)")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
                                        .frame(maxWidth: 70.0, alignment: .leading)
                                    
                                }
                                .frame(maxWidth: 350.0, alignment: .leading)
                                
                                Divider()
                                
                                HStack(alignment: .center) {
                                    Button(action: {
                                        self.showingAlert = true
                                        wateringCount += 1
                                        
                                        
                                    }) {
                                        Text("Done Watering")
                                            .padding()
                                            .padding(.horizontal, 120.0)
                                            .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                                            .foregroundColor(Color.white)
                                            .cornerRadius(20)
                                    }
                                    .alert(isPresented: $showingAlert) { // Step 2
                                        Alert(title: Text("Watering Done"), message: Text("You have watered the plant."), dismissButton: .default(Text("OK")))
                                    }
                                }
                                Spacer().frame(height: 30)
                            }
                            .frame(width: 400.0, height: 400.0)
                            .background(Color.white)
                            .cornerRadius(50)
                        }
                        
                    }
                }
                .frame(width: 400.0, height: 135.0)
            }
            
        }
    }
}


#Preview {
    let plants = ModelData().plants
    
    return Group {
        DetailOwnPlantView(plant: plants[6])
    }
}
