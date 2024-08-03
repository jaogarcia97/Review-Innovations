//
//  SeatSelectionBackground.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/31/24.
//

import SwiftUI

struct SeatSelectionBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(color: Color("LightGreen"), location: 0.0), // Start with LightGreen
                .init(color: Color("DarkGreen"), location: 0.9),  // Extend DarkGreen to
                .init(color: Color("BlueGreen"), location: 1.0)   // Smooth transition to BlueGreen by 100%
            ]),
            startPoint: .topLeading,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SeatSelectionBackground()
}
