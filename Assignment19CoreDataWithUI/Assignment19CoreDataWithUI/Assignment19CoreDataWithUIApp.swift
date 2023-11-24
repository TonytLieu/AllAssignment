//
//  Assignment19CoreDataWithUIApp.swift
//  Assignment19CoreDataWithUI
//
//  Created by Tony Lieu on 11/21/23.
//

import SwiftUI

@main
struct Assignment19CoreDataWithUIApp: App {
    //shared mean it is a singleton
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ProductView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
