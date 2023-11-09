//
//  PokemonTableView.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/8/23.
//

import SwiftUI

struct PokemonTableView: View {
    var nM = NetworkManager()
    @EnvironmentObject var user:UserInfo
   @State var pokemonList = [Data]()
    var body: some View {
        VStack{
            //List(pokemonList){pokemon in
                   // }
            List{
                Text("w")
            }
        }.onAppear(){
            Task{
                pokemonList = try await nM.getDataApi(url: URL(string: ApiEndpoints.pokemomListEndPoint)!, modelType: [Data].self)
            }
    }
        
        }
    
}

#Preview {
    PokemonTableView().environmentObject(UserInfo())
}
