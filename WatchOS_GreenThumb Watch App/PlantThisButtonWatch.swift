//
//  PlantThisButton.swift
//  GreenThumb
//
//  Created by Michael Sin on 30/05/24.
//

import SwiftUI

struct PlantThisButtonWatch: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Text("Done Watering")
                .padding()
                .padding(.horizontal)
                .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                .foregroundColor(Color.white)
                .cornerRadius(20)
        }
    }
}

#Preview {
    PlantThisButtonWatch(isSet: .constant(false))
}
