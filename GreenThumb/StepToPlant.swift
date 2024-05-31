//
//  StepToPlant.swift
//  GreenThumb
//
//  Created by MacBook Pro on 31/05/24.
//

import SwiftUI

struct StepToPlant: View {
    var plant: Plant
    var body: some View {
    VStack {
        MapView()
            .frame(height: 300)


        CircleImage(image:Image(plant.image))
            .offset(y: -130)
            .padding(.bottom, -130)


        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)


            HStack {
                Text("Joshua Tree National Park")
                Spacer()
                Text("California")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)


            Divider()


            Text("About Turtle Rock")
                .font(.title2)
            Text("Descriptive text goes here.")
        }
        .padding()


        Spacer()
    }
}
}

#Preview {
    StepToPlant()
}
