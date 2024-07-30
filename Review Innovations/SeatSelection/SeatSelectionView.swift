//
//  SeatSelectionView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/30/24.
//

import SwiftUI

struct SeatSelectionView: View {
    @State private var animateGradient: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                MainBackground(animateGradient: $animateGradient)
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    SeatSelectionView()
}
