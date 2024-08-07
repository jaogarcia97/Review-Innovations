//
//  SuccessScreenView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 8/4/24.
//

import SwiftUI

struct SuccessScreenView: View {
    @State private var checkmarkScale: CGFloat = 0.0
    @State private var messageOpacity: Double = 0.0
    
    var referenceNo: String = "AEF1230Q1234"
    var studentName: String = "Jose Jaime Felix Garcia"
    var school: String = "Mapua University"
    var section: String = "A1"
    var seatNum: String = "C1"
    
    var formattedDate: String {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter.string(from: Date())
        }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            ZStack{
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color("LightGreen"), Color("BlueGreen")]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(height: 170)
                    .cornerRadius(15)
                    .shadow(radius: 8)
                    .opacity(1.0)
                
                Group {
                    VStack {
                        VStack(alignment: .leading, spacing: 2) {
                            HStack {
                                Text("Reference Number: ").bold()
                                Spacer()
                                Text("\(referenceNo)")
                            }
                            HStack {
                                Text("Name: ").bold()
                                Spacer()
                                Text("\(studentName)")
                            }
                            HStack {
                                Text("School: ").bold()
                                Spacer()
                                Text("\(school)")
                            }
                            HStack {
                                Text("Section: ").bold()
                                Spacer()
                                Text("\(section)")
                            }
                            HStack {
                                Text("Seat Number: ").bold()
                                Spacer()
                                Text("\(seatNum)")
                            }

                            HStack(alignment: .top){
                                Text("Date: ").bold()
                                Spacer()
                                Text("\(formattedDate)")
                            }
                        }
                        //.font(.caption)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        
                    }
                    
                }
            }
            
            Spacer().frame(height: 40)
            
            ZStack{
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 45)
                    .foregroundColor(.green)
                    .scaleEffect(checkmarkScale)
                    .opacity(0.3)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0).delay(0)) {
                            checkmarkScale = 1.3
                        }
                    }
                
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.green)
                    .scaleEffect(checkmarkScale)
                    .opacity(0.5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.8).delay(0)) {
                            checkmarkScale = 1.2
                        }
                    }
                
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 34, height: 34)
                    .foregroundColor(.green)
                    .scaleEffect(checkmarkScale)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            checkmarkScale = 1.0
                        }
                    }
            }
            
            Spacer().frame(height: 20)
            Text("Seat Assigment Successful!")
                .font(.system(size: 14))
            //.font(.largeTitle)
                .bold()
                .foregroundColor(.green)
                .opacity(messageOpacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0).delay(0.0)) {
                        messageOpacity = 1.0
                    }
                }
            
            
            
            
            
            Spacer().frame(height: 20)
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SuccessScreenView()
}
