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
                Spacer().frame(height: 30)

                Text("GreenThumb")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeInOut(duration: 1), value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                    .padding(.top, 20)
            }
        }
    }
}

#Preview {
    LoadingView()
}
