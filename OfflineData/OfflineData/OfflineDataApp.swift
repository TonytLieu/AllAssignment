//
//  OfflineDataApp.swift
//  OfflineData
//
//  Created by Tony Lieu on 11/21/23.
//

import SwiftUI

@main
struct OfflineDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
