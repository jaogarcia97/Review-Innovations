//
//  SectionScheduleCell.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/31/24.
//

import SwiftUI

struct SectionScheduleCell: View {
    
    var schedule: ClassSchedule
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(8)
                .shadow(color: .yellow, radius: 1, x: 0, y: 0)
            
            HStack {
                Text("\(schedule.sectionName)")
                    .font(.system(size: 50))
                    .bold()
                    .padding(.leading, 20)
                
                Spacer().frame(width:5)
                
                VStack(alignment: .leading){
                    Text("\(schedule.timeSlot.displayText)")
                        .font(.system(size: 20))
                        .bold()
                    
                    Text("on \(schedule.classDays.displayText)")
                        .font(.system(size: 12))
                        .bold()
                    
                    Text("at \(schedule.branch.rawValue) Branch")
                        .font(.system(size: 12))
                        
                }
                //.frame(maxWidth: .infinity , alignment: .leading)
                Spacer()
            }
            .foregroundColor(.black)
        }
        .frame(width: 330,height: 110)
    }
}

#Preview {
    SectionScheduleCell(schedule: ClassSchedule(sectionName: "A3",
                                                classDays: .mwf,
                                                branch: .baguio,
                                                timeSlot: .afternoon))
}
