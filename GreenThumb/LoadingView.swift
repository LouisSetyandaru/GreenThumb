//
//  LoadingView.swift
//  GreenThumb
//
//  Created by Michael Sin on 05/06/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, Color(red: 73/255, green: 133/255, blue: 83/255)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(2)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .onAppear {
                        isAnimating = true
                    }

                Text("GreenThumb")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 20)
            }
        }
    }
}

#Preview {
    LoadingView()
}