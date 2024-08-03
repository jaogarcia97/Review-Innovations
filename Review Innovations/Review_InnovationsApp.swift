//
//  Review_InnovationsApp.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/29/24.
//

import SwiftUI

@main
struct Review_InnovationsApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject private var model = Model()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(model)
        }
    }
}
