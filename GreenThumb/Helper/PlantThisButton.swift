//
//  PlantThisButton.swift
//  GreenThumb
//
//  Created by Michael Sin on 30/05/24.
//

import SwiftUI

struct PlantThisButton: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Text("Plant This")
                .padding()
                .padding(.horizontal, 120.0)
                .background(Color(red: 73/255, green: 133/255, blue: 83/255))
                .foregroundColor(Color.white)
                .cornerRadius(20)
        }
    }
}

#Preview {
    PlantThisButton(isSet: .constant(true))
}
