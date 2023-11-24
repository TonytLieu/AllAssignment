//
//  WalmartAppApp.swift
//  WalmartApp
//
//  Created by Tony Lieu on 11/23/23.
//

import SwiftUI

@main
struct WalmartAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
                WalmartProductListPage().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
