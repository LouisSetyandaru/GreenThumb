import SwiftUI

struct PlantCardWatch: View {
    var plant: Plant
    
    var body: some View {
        VStack() {
            Circle()
                           .foregroundColor(.white)
                           .frame(width: 70, height: 70)
                           .padding(5)
            Text(plant.name)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(width: 120.0, height: 50.0)
                
          
        }
        .padding()
        .background(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
        .cornerRadius(15)
        .shadow(radius: 3)
        .frame(width: 180.0, height: 90.0)
    }
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        PlantCardWatch(plant: plants[8])

    }
}
