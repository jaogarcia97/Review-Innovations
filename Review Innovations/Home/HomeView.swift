//
//  HomeView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/29/24.
//

import SwiftUI

struct HomeView: View {
    @State private var animateGradient: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack {
            // Background gradient
            MainBackground(animateGradient: $animateGradient)
            
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack() {
                        //Seat Selection
                        NavigationLink(destination: SeatSelectionView()) {
                            VStack {
                                Rectangle()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                                Spacer().frame(height: 10)
                                Text("Seat Reservation")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(width: 112, height: 120)
                            
                        }
                        
                        NavigationLink(destination: SeatSelectionView()) {
                            VStack {
                                Rectangle()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                                Spacer().frame(height: 10)
                                Text("Pay Tuition")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(width: 112, height: 120)
                            
                        }
                        
                        NavigationLink(destination: SeatSelectionView()) {
                            VStack {
                                Rectangle()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                                Spacer().frame(height: 10)
                                Text("RI AI Assist")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(width: 112, height: 120)
                            
                        }
                        
                        NavigationLink(destination: SeatSelectionView()) {
                            VStack {
                                Rectangle()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                                Spacer().frame(height: 10)
                                Text("RI Exam")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .frame(width: 112, height: 120)
                            
                        }
                    }
                    .padding(.leading, 20)
                    
                }
                .frame(height: 150)
                
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
