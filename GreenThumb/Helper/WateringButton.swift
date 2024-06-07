//
//  WateringButton.swift
//  GreenThumb
//
//  Created by Michael Sin on 07/06/24.
//

import SwiftUI

struct WateringButton: View {
    @Binding var wateringCount: Int
    @State private var showingAlert = false

    var body: some View {
        Button(action: handleButtonTap) {
            Text("Done Watering")
                .font(.system(size: 15))
                .padding()
                .padding(.horizontal, 60.0)
                .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                .foregroundColor(Color.white)
                .cornerRadius(20)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Watering Done"), message: Text("You have watered the plant."), dismissButton: .default(Text("OK")))
        }
    }

    private func handleButtonTap() {
        self.showingAlert = true
        wateringCount += 1
    }
}

#Preview {
    WateringButton(wateringCount: .constant(0))
}
