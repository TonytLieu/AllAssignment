//
//  pokemon.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import Foundation
//pokemon model
// MARK: - Temperatures
struct PokemonData: Codable {
    let data: [Pokemon]
}

struct Pokemon: Codable, Identifiable {
    let id, name: String
    let supertype: String?
    let subtypes: [String]?
    let hp: String?
    let types: [String]
    let level: String?
}

