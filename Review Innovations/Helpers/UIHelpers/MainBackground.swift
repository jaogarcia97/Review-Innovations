//
//  MainBackground.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/29/24.
//

import SwiftUI

struct MainBackground: View {
    
    @Binding var animateGradient: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color("LightGreen"), location: 0.0), // Start with LightGreen
                .init(color: Color("DarkGreen"), location: 0.6),  // Smooth transition to DarkGreen by 40%
                .init(color: Color("DarkGreen"), location: 0.8),  // Extend DarkGreen to 60%
                .init(color: Color("BlueGreen"), location: 1.0)   // Smooth transition to BlueGreen by 100%
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .hueRotation(.degrees(animateGradient ? 45 : 0))
        .onAppear{
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)){
                animateGradient.toggle()
            }
        }
    }
}

#Preview {
    MainBackground(animateGradient: .constant(false))
}
