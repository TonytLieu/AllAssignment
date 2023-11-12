//
//  GetAPiView.swift
//  PokemonFirstSwiftUI
//
//  Created by Tony Lieu on 11/10/23.
//

import Foundation
class PokemonViewModel{
    let endpoint = ApiEndpoints.shared
    @Published var pokemonList = [Pokemon]()
    var count:Int = 0
    func getApi(nM: NetworkManager, endpoint:ApiEndpoints, pokemon: inout [Pokemon]) async {
        if(count != 1){
            var pokemon = [Pokemon]()
            await getApi(nM: nM, endpoint: endpoint, pokemon: &pokemon)
            count+=1
        }
        do{
            var pokemonList = try await nM.getDataApi(url: URL(string: endpoint.pokemomListEndPoint)!, modelType: PokemonData.self)
            DispatchQueue.main.async {
                
                self.pokemonList = pokemonList.data
            }
        }catch {
            print(error.localizedDescription)
        }
    }
}
