//
//  FormUser.swift
//  GreenThumb
//
//  Created by student on 30/05/24.
//

import SwiftUI

struct FormUser: View {
    // Propertiers
    @State private var name = ""

    // View
    var body: some View {
        VStack() {
            // Title
            Text("GreenThumb")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 40)
                .shadow(radius: 10.0, x: 20, y: 10)
            // Icon
            Image("AppIcon")
                .resizable()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 50)
            // Form
            VStack(alignment: .leading, spacing: 15) {
                TextField("Name", text: self.$name)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            Spacer()

        }
        // Background Color
        .background(
            LinearGradient(gradient: Gradient(colors: [.green, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
        
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}

#Preview {
    FormUser()
}
