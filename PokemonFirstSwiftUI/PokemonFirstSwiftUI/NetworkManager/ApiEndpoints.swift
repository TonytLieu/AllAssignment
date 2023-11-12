//
//  ApiEndpoints.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import Foundation
actor ApiEndpoints{
    static var shared = ApiEndpoints()
    
    var pokemomListEndPoint = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=15"
    
    private init(pokemomListEndPoint: String = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=15") {
        self.pokemomListEndPoint = pokemomListEndPoint
    }
}
