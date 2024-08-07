//
//  SeatConfirmationView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 8/3/24.
//

import SwiftUI

struct SeatConfirmationView: View {
    
    var section: String = "A1"
    var schedule: String = "Mondays, Wednesdays, and Fridays"
    var branch: String = "Manila"
    var seatCode: String = "C1"
    
    var studentName: String = "Jose Jaime Felix Garcia"
    var school: String = "Mapua University"
    
    @State private var studentKey: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text("Confirm Seat")
                    .bold()
                    .font(.system(size: 20))
                    .padding(.leading, 20)
                Spacer()
            }
            
            //MARK: - Seat Information
            ZStack{
                Rectangle()
                    .foregroundColor(Color("DarkGreen"))
                    .cornerRadius(8)
                    .shadow(radius: 10)
                    .frame(height: 120)
                
                
                HStack {
                    
                    Spacer().frame(width: 10)
                    VStack {
                        Text("\(section)")
                            .bold()
                            .font(.system(size: 30))
                        Text("section")
                            .font(.system(size: 12))
                    }
                    VStack{

                        Text("-")
                            .bold()
                            .font(.system(size: 30))
                        Spacer().frame(height: 10)
                    }
                    
                    VStack {
                        Text("\(seatCode)")
                            .bold()
                            .font(.system(size: 30))
                        Text("seatcode")
                            .font(.system(size: 12))
                    }
                    
                    VStack(alignment: .leading){
                        Text("\(Text(schedule).bold())")
                            .font(.system(size: 15))
                            .padding(.leading, 10)
                            .font(.system(size: 10))
                        Spacer().frame(height: 10)
                        Text("in \(Text(branch).bold())")
                            .font(.system(size: 15))
                            .padding(.leading, 10)
                    }
                
                }
                .foregroundColor(.white)
            }
            .padding(.horizontal, 20)
            
            Spacer().frame(height: 30)
            
            //MARK: - Student information
            VStack(alignment: .leading){
                HStack{
                    Text("Student Name: ")
                        .font(.system(size: 15))
                        .bold()
                    Text(studentName)
                        .font(.system(size: 15))
                }
                
                Spacer().frame(height: 5)
                HStack {
                    Text("School: ")
                        .font(.system(size: 15))
                    .bold()
                    
                    Text(school)
                        .font(.system(size: 15))
                }
                
            }
            .padding(.leading, 20)
            
            
            Spacer()
            //MARK: - Confirm Button
            NavigationLink{
                SuccessScreenView()
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(height: 50)
                        .cornerRadius(8)
                    
                    Text("Confirm")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding(.horizontal, 20)
            
        }
    }
}

#Preview {
    SeatConfirmationView()
}
