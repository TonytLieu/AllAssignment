//
//  PlanentViewListCell.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//

import SwiftUI

struct PlanentViewListCell: View {
    @State var PlanetList = [PlanetDetailList]()
    var body: some View {
        Text("Planets")
        NavigationStack{
            List(){
                NavigationLink("Planet Name") {
                    PlanetDetails(rotationPeriod: "", orbitalPeriod: "", diameter: "", gravity: "", terrain: "", surfaceWater: "", created: "", edited: "")
                }
            }
        }
    }
}

#Preview {
    PlanentViewListCell()
}
