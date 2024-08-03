//
//  ClassSchedule.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 8/2/24.
//

import Foundation


struct ClassSchedule: Identifiable {
    var id = UUID()
    var sectionName: String
    var classDays: ClassDays
    var branch: Branch
    var timeSlot : Timeslot
}

enum ClassDays: String, Identifiable {
    case mwf = "MWF"
    case tths = "TThS"
    case wknd =  "Wknd"
    
    var id: ClassDays { self }
}

extension ClassDays {
    var displayText: String {
        switch self {
        case .mwf: return "Mondays, Wednesdays, and Fridays"
        case .tths: return "Tuesdays and Thursdays"
        case .wknd: return "Weekends"
        }
    }
}

enum Branch: String, Identifiable {
    case manila = "MANILA"
    case baguio = "BAGUIO"
    case davao = "DAVAO"
    case cebu = "CEBU"
    
    var id: Branch { self }
}

enum Timeslot: String, Identifiable {
    case morning = "8:00AM - 12:00 PM"
    case afternoon = "1:30PM - 5:30PM"
    case evening = "6:30PM - 9:30PM"
    
    var id: Timeslot { self }
}

extension Timeslot {
    var displayText: String {
        switch self {
        case .morning: return "8:00AM - 12:00PM"
        case .afternoon: return "1:30PM - 5:30PM"
        case .evening: return "6:30PM - 9:30PM"
        }
    }
}

