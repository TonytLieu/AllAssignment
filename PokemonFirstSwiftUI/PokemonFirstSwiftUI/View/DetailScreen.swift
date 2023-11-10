//
//  DetailScreen.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct DetailScreen: View {
    var type:String
    var lvl:String?
    
    var body: some View {
        Text("Type: \(type)")
        Text("Level:\(lvl ?? "")")
    }
}

#Preview {
    DetailScreen(type: "",lvl:"")
}
