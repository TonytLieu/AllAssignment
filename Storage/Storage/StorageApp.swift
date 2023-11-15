//
//  StorageApp.swift
//  Storage
//
//  Created by Tony Lieu on 11/13/23.
//

import SwiftUI

@main
struct StorageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
