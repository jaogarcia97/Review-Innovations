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
                .frame(width: 300,height: 120)
                .cornerRadius(8)
                .shadow(color: .yellow, radius: 1, x: 0, y: 0)
            
            VStack(alignment: .leading){
                Text("\(schedule.timeSlot.displayText)")
                    .font(.system(size: 25))
                    .bold()
                
                Text("on \(schedule.classDays.displayText)")
                    .font(.system(size: 14))
                    .bold()
                
                Text("at \(schedule.branch.rawValue) Branch")
                    .font(.system(size: 14))
                    
            }
            .frame(maxWidth: .infinity , alignment: .leading)
            .padding(.leading, 12)
            .foregroundColor(.black)
        }
    }
}

#Preview {
    SectionScheduleCell(schedule: ClassSchedule(sectionName: "A1",
                                                classDays: .mwf,
                                                branch: .baguio,
                                                timeSlot: .afternoon))
}
