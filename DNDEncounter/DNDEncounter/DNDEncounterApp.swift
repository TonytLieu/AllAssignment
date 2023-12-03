//
//  DNDEncounterApp.swift
//  DNDEncounter
//
//  Created by Tony Lieu on 11/28/23.
//

import SwiftUI

@main
struct DNDEncounterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TestView().environmentObject(Coordinate())
        }
    }
}
