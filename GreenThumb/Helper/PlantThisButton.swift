//
//  PlantThisButton.swift
//  GreenThumb
//
//  Created by Michael Sin on 06/06/24.
//

import SwiftUI

struct PlantThisButton: View {
    
    @Binding var isSet: Bool
    @Binding var navigateStepToPlant: Bool
    
    var body: some View {
        Button(action: buttonAction) {
            buttonLabel
        }
    }
    
    private func buttonAction() {
        isSet.toggle()
        navigateStepToPlant = true
    }
    
    private var buttonLabel: some View {
        Text("Plant This")
            .padding()
            .padding(.horizontal, 120.0)
            .background(Color(red: 73/255, green: 133/255, blue: 83/255))
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

#Preview {
    PlantThisButton(isSet: .constant(true), navigateStepToPlant: .constant(false))
}
