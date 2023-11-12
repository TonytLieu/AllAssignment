//
//  pokemon.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import Foundation
//pokemon model
struct PokemonData: Codable {
    let data: [Pokemon]
}

struct Pokemon: Codable, Identifiable{
    let id, name: String
    //incorrect Parsing Error
   // let id, namesdkmskfmeks: String
    let supertype: String?
    let subtypes: [String]?
    let hp: String?
    let types: [String]
    let level: String?
}

