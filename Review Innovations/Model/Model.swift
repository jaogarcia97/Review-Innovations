//
//  Model.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 8/2/24.
//

import Foundation


//Aggregate Model
@MainActor
class Model: ObservableObject {
    
    @Published var classes: [ClassSchedule] = []
    
    func loadSchedules() {
        // Define the predefined schedules
        let predefinedSchedules = [
            ClassSchedule(sectionName: "A1", classDays: .mwf, branch: .manila, timeSlot: .morning),
            ClassSchedule(sectionName: "A2", classDays: .tths, branch: .baguio, timeSlot: .morning),
            ClassSchedule(sectionName: "A3", classDays: .wknd, branch: .cebu, timeSlot: .morning),
            ClassSchedule(sectionName: "A4", classDays: .mwf, branch: .davao, timeSlot: .morning),
            ClassSchedule(sectionName: "A5", classDays: .tths, branch: .manila, timeSlot: .morning),
            ClassSchedule(sectionName: "B1", classDays: .wknd, branch: .baguio, timeSlot: .afternoon),
            ClassSchedule(sectionName: "B2", classDays: .mwf, branch: .cebu, timeSlot: .afternoon),
            ClassSchedule(sectionName: "B3", classDays: .tths, branch: .davao, timeSlot: .afternoon),
            ClassSchedule(sectionName: "B4", classDays: .wknd, branch: .manila, timeSlot: .afternoon),
            ClassSchedule(sectionName: "B5", classDays: .mwf, branch: .baguio, timeSlot: .afternoon),
            ClassSchedule(sectionName: "C1", classDays: .tths, branch: .cebu, timeSlot: .evening),
            ClassSchedule(sectionName: "C2", classDays: .wknd, branch: .davao, timeSlot: .evening),
            ClassSchedule(sectionName: "C3", classDays: .mwf, branch: .manila, timeSlot: .evening),
            ClassSchedule(sectionName: "C4", classDays: .tths, branch: .baguio, timeSlot: .evening),
            ClassSchedule(sectionName: "C5", classDays: .wknd, branch: .cebu, timeSlot: .evening)
        ]
        
        // Load the schedules into the classes property
        self.classes = predefinedSchedules
    }
    
    func assignSchedule(){
        
    }
    
}
