//
//  Planets.swift
//  PlanetsApp
//
//  Created by Tony Lieu on 11/20/23.
//

import Foundation
struct planetList: Decodable{
    let count: Int
    let next: String
    let previous: URL?
    var results: [PlanetDetailList]
}
struct PlanetDetailList: Codable, Identifiable{
    var id = UUID()
    let name, rotationPeriod, orbitalPeriod, diameter: String
        let climate, gravity, terrain, surfaceWater: String
        let population: String
        let residents, films: [String]
        let created, edited: String
        let url: String

        enum CodingKeys: String, CodingKey {
            case name
            case rotationPeriod = "rotation_period"
            case orbitalPeriod = "orbital_period"
            case diameter, climate, gravity, terrain
            case surfaceWater = "surface_water"
            case population, residents, films, created, edited, url
        }

}
