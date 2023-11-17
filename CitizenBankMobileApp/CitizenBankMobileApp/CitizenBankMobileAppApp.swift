//
//  CitizenBankMobileAppApp.swift
//  CitizenBankMobileApp
//
//  Created by Tony Lieu on 11/16/23.
//

import SwiftUI

@main
struct CitizenBankMobileAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
