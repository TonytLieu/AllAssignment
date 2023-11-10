//
//  pokemonCell.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/9/23.
//

import SwiftUI

struct pokemonCell: View {
        var pokemonName:String
        var type:String
        var lvl:String?
        var body: some View {
            HStack{
                Text(pokemonName)
                Text(lvl ?? "")
            }
            }
        }

#Preview {
    pokemonCell(pokemonName: "",type: "",lvl: "")
}
