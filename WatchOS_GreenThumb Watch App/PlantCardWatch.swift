import SwiftUI

struct PlantCardWatch: View {
    var plant: Plant
    
    var body: some View {
        HStack( spacing: 3.0) {
            Text(plant.name)
                .font(.headline)
                .foregroundColor(.primary)
                .frame(width: 100.0, height: 100.0)
          
        }
        .padding()
        .background(Color(red: 0.28627450980392155, green: 0.5215686274509804, blue: 0.3254901960784314))
        .cornerRadius(8)
        .shadow(radius: 3)
        .frame(width: 180.0, height: 102.0)
    }
}

#Preview {
    let plants = ModelData().plants
    
    return Group {
        PlantCardWatch(plant: plants[8])

    }
}
