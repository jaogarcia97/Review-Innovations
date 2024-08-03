//
//  ContentView.swift
//  Review Innovations
//
//  Created by Jose Jaime Garcia on 7/29/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var animateGradient: Bool = false
    @State private var selection: Tab = .menu
    
    enum Tab {
        case menu
        case settings
    }

    var body: some View {
        TabView(selection: $selection) {
            NavigationView { HomeView() }
                .tabItem {
                    let menuText = Text("Menu",
                                        comment: "Features Menu ")
                    Label {
                        menuText
                    } icon: {
                        Image(systemName: "house.fill")
                    }.accessibility(label: menuText)
                }
                .tag(Tab.menu)
            
            NavigationView { SettingsView() }
                .tabItem {
                    Label {
                        Text("Favorites",
                             comment: "User Settings Tab")
                    } icon: {
                        Image(systemName: "gearshape.fill")
                    }
                }
                .tag(Tab.settings)
        }
    }
}


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
