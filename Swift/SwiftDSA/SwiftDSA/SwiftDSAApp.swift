//
//  SwiftDSAApp.swift
//  SwiftDSA
//
//  Created by Emre Mert on 21.11.2025.
//

import SwiftUI
import CoreData

@main
struct SwiftDSAApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
