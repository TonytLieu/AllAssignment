//
//  PlanetsAppApp.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//

import SwiftUI

@main
struct PlanetsAppApp: App {
    var body: some Scene {
        WindowGroup {
            PlanetListView(seachable:Searchingfilter(popular: PopulateListOfCombine()))
        }
    }
}
