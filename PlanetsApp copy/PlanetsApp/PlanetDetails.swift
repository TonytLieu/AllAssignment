//
//  PlanetDetails.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//

import SwiftUI

struct PlanetDetails: View {
    var rotationPeriod, orbitalPeriod, diameter: String
    var gravity, terrain, surfaceWater:String
    var created, edited: String
    var body: some View {
        Text("Rotation Period: \(rotationPeriod)")
        Text("Orbital Period: \(orbitalPeriod) ")
        Text("Diameter: \(diameter)")
        Text("Gravity: \(gravity)")
        Text("Terrain: \(terrain)")
        Text("Surface Water: \(surfaceWater)")
        Text("created: \(created)")
        Text("edited: \(edited)")
    }
}

#Preview {
    PlanetDetails(rotationPeriod: "", orbitalPeriod: "", diameter: "", gravity: "", terrain: "", surfaceWater: "", created: "", edited: "")
}
